package gov.dhs.nppd.humanreview.util;

import java.time.OffsetDateTime;
import java.util.ArrayList;
import java.util.HashMap;
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
public class JsonDocProcessor {
	private static final Logger LOGGER = LoggerFactory.getLogger(JsonDocProcessor.class);
	private HashMap<String, Object> elements = null;
	private List<String> incomingDocs = new ArrayList<>();
	private static final String JSON_PROCESSING_ERROR = "Error Processing json doc: {}";

	@Autowired
	private HumanreviewRepository hrRepo;

	public void setHrRepo(HumanreviewRepository hrRepo) {
		this.hrRepo = hrRepo;
	}

	public void setJsonDataRepo(JsonDataRepository jsonDataRepo) {
		this.jsonDataRepo = jsonDataRepo;
	}

	@Autowired
	private JsonDataRepository jsonDataRepo;

	public void loadJsonDoc(String jsonDoc) {
		JsonParser parser = new JsonParser();

		JsonObject jsonTree = parser.parse(jsonDoc).getAsJsonObject();
		elements = new HashMap<>();
		List<String> hrItemPaths = new ArrayList<>();

		getElements(jsonTree, "$");
		LOGGER.info("*** Found {} elmenents (primitives & null)", elements.size());
		LOGGER.info(">>> searching human review");

		elements.keySet().stream().forEach(path -> {
			String value = elements.get(path).toString();
			if (value != null && value.contains("!!!###HUMAN REVIEW###!!!")) {
				hrItemPaths.add(path);
			}
		});

		LOGGER.info("*** Found {} HR items", hrItemPaths.size());

		hrItemPaths.stream().forEach(hrItemPath -> {
			LOGGER.info(">>> {}: {}", hrItemPath, elements.get(hrItemPath));
			LOGGER.info("<<< {}: {}", hrItemPath, JsonPath.read(jsonDoc, hrItemPath));

			LOGGER.info("Got hrItemPath = {}", hrItemPath);
			LOGGER.info("Got elements.get = {}", elements.get(hrItemPath));
			HumanReviewItem hrItem = new HumanReviewItem();
			JsonData jsonData = new JsonData();
			String stixId = jsonTree.get("id").toString().replaceAll("^\"|\"$", "");
			if (stixId == null || stixId.isEmpty()) {
				jsonTree.get("guid").toString().replaceAll("^\"|\"$", "");
			}
			jsonData.setStixId(stixId);
			jsonData.setOriginalJson(jsonDoc);
			jsonData.setModifiedJson(jsonDoc);

			int beginIndex = hrItemPath.indexOf('.');
			int endIndex = hrItemPath.lastIndexOf('.');
			int endIndexForFieldObject = hrItemPath.indexOf('[');
			hrItem.setStixId(stixId);
			hrItem.setFieldName(hrItemPath.substring(endIndex + 1));
			hrItem.setFieldValue(elements.get(hrItemPath).toString().replace("!!!###HUMAN REVIEW###!!!", ""));
			hrItem.setFieldLocation(hrItemPath);
			hrItem.setAction(HumanReviewItem.ActionEnum.BLANK);
			hrItem.setStatus("New");
			hrItem.setModifiedDate(OffsetDateTime.now());
			hrItem.setOriginalDate(OffsetDateTime.now());
			hrItem.setObjectType(hrItemPath.substring(beginIndex + 1, endIndexForFieldObject));
			LOGGER.info("Got hritem = {}", hrItem);
			hrRepo.save(hrItem);
			jsonDataRepo.save(jsonData);

		});

	}

	private void getElements(JsonObject jsonTree, String elName) {

		jsonTree.entrySet().stream().forEach(entry -> {
			String curElName;
			if (elName.isEmpty()) {
				curElName = entry.getKey();
			} else {
				curElName = elName + "." + entry.getKey();
			}

			LOGGER.info("{}:{}:{}", curElName, entry.getValue(), entry.getValue().getClass().getName());
			if (entry.getValue() instanceof JsonNull || entry.getValue() instanceof JsonPrimitive) {
				elements.put(curElName, entry.getValue());
			}

			if (jsonTree.get(entry.getKey()) != null) {
				try {
					if (jsonTree.get(entry.getKey()) instanceof JsonArray) {
						JsonArray array = jsonTree.get(entry.getKey()).getAsJsonArray();
						for (int i = 0; i < array.size(); i++) {
							getElements(array.get(i).getAsJsonObject(), curElName + "[" + i + "]");
						}
					}
				} catch (Exception e) {
					LOGGER.error(JSON_PROCESSING_ERROR, e);
				}
				try {
					if (jsonTree.get(entry.getKey()) instanceof JsonObject) {
						getElements(jsonTree.get(entry.getKey()).getAsJsonObject(), curElName);
					}
				} catch (Exception e) {
					LOGGER.error(JSON_PROCESSING_ERROR, e);
				}
			}
		});
	}
}
