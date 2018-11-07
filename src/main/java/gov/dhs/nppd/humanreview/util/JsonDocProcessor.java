package gov.dhs.nppd.humanreview.util;


import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.openapitools.model.HumanReviewItem;
import org.openapitools.repository.HumanreviewRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.jayway.jsonpath.JsonPath;

public class JsonDocProcessor extends Thread {
	private Logger logger = LoggerFactory.getLogger(JsonDocProcessor.class);
	private Hashtable<String, Object> elements = null;
	private List<String> incomingDocs = new ArrayList<String>();
	
	@Autowired
	private HumanreviewRepository hrRepo;

	public void run() {
		logger.info("Json Doc processor starts ...");
		boolean running = true;

		while (running) {
			String doc = null;
			synchronized (incomingDocs) {
				if (incomingDocs.size() > 0) {
					doc = incomingDocs.remove(0);
				}
			}
			if (doc != null) {
				logger.info("processing incoming json doc ...");
				try {
					loadJsonDoc(doc);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		logger.info("Json Doc processor ends ...");
	}

	public void queueDoc(String doc) {
		synchronized (incomingDocs) {
			incomingDocs.add(doc);
		}
	}

	public void loadJsonDoc(String jsonDoc) throws IOException {
		JsonParser parser = new JsonParser();

		JsonObject jsonTree = parser.parse(jsonDoc).getAsJsonObject();
		elements = new Hashtable<String, Object>();
		List<String> hrItemPaths = new ArrayList<String>();

		getElements(jsonTree, "$");
		logger.info(String.format("*** Found %d elmenents (primitives & null)", elements.size()));
		logger.info(">>> searching human review");

		elements.keySet().stream().forEach(path -> {
			String value = elements.get(path).toString();
			if (value != null && value.contains("!!!###HUMAN REVIEW###!!!")) {
				hrItemPaths.add(path);
			}
		});

//		RestClient restClient = new RestClient("http://localhost:8080");
//		String token = restClient.getAuthToken("User1", "Pass1");
//		logger.info("Got da token: " + token);

		logger.info(String.format("*** Found %d HR items", hrItemPaths.size()));

		hrItemPaths.stream().forEach(hrItemPath -> {
			logger.info(String.format(">>> %s: %s", hrItemPath, elements.get(hrItemPath)));
			logger.info(String.format("<<< %s: '%s'", hrItemPath, JsonPath.read(jsonDoc, hrItemPath)));
			
			logger.info("Got hrItemPath = " + hrItemPath);
			logger.info("Got elements.get = " + elements.get(hrItemPath));
			HumanReviewItem hrItem = new HumanReviewItem();
			int beginIndex = hrItemPath.indexOf(".");
			int endIindex = hrItemPath.lastIndexOf(".");
			hrItem.setFieldName(hrItemPath.substring(endIindex+1));
			hrItem.setFieldValue(elements.get(hrItemPath).toString());
			hrItem.setFieldLocation(hrItemPath.substring(beginIndex+1,endIindex+1));
			hrItem.setAction(HumanReviewItem.ActionEnum.BLANK);
			logger.info("Got hritem = " + hrItem);
			hrRepo.save(hrItem);
			 
//			try {
//				restClient.createHrItem(hrItem, token);
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		});

	}

//	private String getHrBackendToken(String username, String password) throws IOException {
//		RestClient restClient = new RestClient("http://localhost:8080");
//		return restClient.getAuthToken(username, password);
//	}

	private void getElements(JsonObject jsonTree, String elName) {

		jsonTree.entrySet().stream().forEach((entry) -> {
			String curElName;
			if (elName.isEmpty()) {
				curElName = entry.getKey();
			} else {
				curElName = elName + "." + entry.getKey();
			}

			logger.info(curElName + ":" + entry.getValue() + ":" + entry.getValue().getClass().getName());
			if (entry.getValue() instanceof JsonNull || entry.getValue() instanceof JsonPrimitive) {
				elements.put(curElName, entry.getValue());
			}

			if (jsonTree.get(entry.getKey()) != null) {
				try {
					if (jsonTree.get(entry.getKey()).getAsJsonArray() instanceof JsonArray) {
						JsonArray array = jsonTree.get(entry.getKey()).getAsJsonArray();
						for (int i = 0; i < array.size(); i++) {
							getElements(array.get(i).getAsJsonObject(), curElName + "[" + i + "]");
						}
					}
				} catch (Exception e) {
				}
				try {
					if (jsonTree.get(entry.getKey()).getAsJsonObject() instanceof JsonObject) {
						getElements(jsonTree.get(entry.getKey()).getAsJsonObject(), curElName);
					}
				} catch (Exception e) {
				}
			}
		});
	}
}
