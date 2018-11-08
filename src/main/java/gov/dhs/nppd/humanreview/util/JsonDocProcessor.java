package gov.dhs.nppd.humanreview.util;


import java.io.IOException;
import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.JsonData;
import org.openapitools.repository.HumanreviewRepository;
import org.openapitools.repository.JsonDataRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonNull;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.jayway.jsonpath.JsonPath;

@Component
public class JsonDocProcessor extends Thread {
	private Logger logger = LoggerFactory.getLogger(JsonDocProcessor.class);
	private Hashtable<String, Object> elements = null;
	private List<String> incomingDocs = new ArrayList<String>();
	private JsonParser parser;
	
	@Autowired
	private HumanreviewRepository hrRepo;
	
	@Autowired
	private JsonDataRepository jsonDataRepo;

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

	public void loadJsonDoc(String jsonDoc) throws IOException {
	    parser = new JsonParser();

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

		logger.info(String.format("*** Found %d HR items", hrItemPaths.size()));

		hrItemPaths.stream().forEach(hrItemPath -> {
			logger.info(String.format(">>> %s: %s", hrItemPath, elements.get(hrItemPath)));
			logger.info(String.format("<<< %s: '%s'", hrItemPath, JsonPath.read(jsonDoc, hrItemPath)));
			
			logger.info("Got hrItemPath = " + hrItemPath);
			logger.info("Got elements.get = " + elements.get(hrItemPath));
			HumanReviewItem hrItem = new HumanReviewItem();
			JsonData jsonData = new JsonData();
			String stixId = jsonTree.get("guid").toString().replaceAll("^\"|\"$", "");
			jsonData.setStixId(stixId);
			jsonData.setOriginalJson(jsonDoc);
			
			int beginIndex = hrItemPath.indexOf(".");
			int endIndex = hrItemPath.lastIndexOf(".");
			int endIndexForFieldObject = hrItemPath.indexOf("[");
			hrItem.setStixId(stixId);
			hrItem.setFieldName(hrItemPath.substring(endIndex+1));
			hrItem.setFieldValue(elements.get(hrItemPath).toString().replace("!!!###HUMAN REVIEW###!!!", ""));
			hrItem.setFieldLocation(hrItemPath);
			hrItem.setAction(HumanReviewItem.ActionEnum.BLANK);
			hrItem.setStatus("New");
			hrItem.setModifiedDate(OffsetDateTime.now());
			hrItem.setOriginalDate(OffsetDateTime.now());
			hrItem.setObjectType(hrItemPath.substring(beginIndex+1,endIndexForFieldObject));
			logger.info("Got hritem = " + hrItem);
			hrRepo.save(hrItem);
			jsonDataRepo.save(jsonData);

		});

	}


	public void setParser(JsonParser parser) {
		this.parser = parser;
	}

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
