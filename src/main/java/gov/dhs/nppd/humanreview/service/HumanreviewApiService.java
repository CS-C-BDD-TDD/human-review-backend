package gov.dhs.nppd.humanreview.service;

import static org.openapitools.model.humanreview.HumanReviewItem.ActionEnum.CONFIRM_RISK;
import static org.openapitools.model.humanreview.HumanReviewItem.ActionEnum.EDIT;
import static org.openapitools.model.humanreview.HumanReviewItem.ActionEnum.NOT_PII;
import static org.openapitools.model.humanreview.HumanReviewItem.ActionEnum.REDACT;

import java.time.OffsetDateTime;

import javax.persistence.EntityManager;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.json.JSONException;
import org.json.JSONObject;
import org.openapitools.model.humanreview.HumanReviewItem;
import org.openapitools.model.humanreview.JsonData;
import org.openapitools.model.humanreview.ListOfHumanReviewItems;
import org.openapitools.repository.humanreview.HumanreviewRepository;
import org.openapitools.repository.humanreview.JsonDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;

import com.netflix.hystrix.contrib.javanica.annotation.DefaultProperties;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

import gov.dhs.nppd.humanreview.amq.Sender;
import gov.dhs.nppd.humanreview.util.CommonUtil;
import gov.dhs.nppd.humanreview.util.JsonDocProcessor;
import io.swagger.annotations.ApiParam;

@Service("humanreviewApiService")
@DefaultProperties(defaultFallback = "fallback")
public class HumanreviewApiService {

	private static final String TOKEN_STRING = "token";
	private static final Logger LOGGER = LogManager.getLogger(HumanreviewApiService.class);

	//
	@Autowired
	HumanreviewRepository hrRepo;

	@Autowired
	CommonUtil commonUtil;

	@Autowired
	private JsonDataRepository jsonDataRepo;

	@Autowired
	JsonDocProcessor jsonDocProc;

	@Autowired
	Sender sender;

	//@Autowired //Switch this out to use the new EntityManager Created
	//protected EntityManager em;

	//public void setEm(EntityManager em) {
	//	this.em = em;
	//}

	@HystrixCommand
	public ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet(HttpHeaders headers) {

		ListOfHumanReviewItems listOfHumanReviewItems = new ListOfHumanReviewItems();

		LOGGER.debug("token: " + headers.get(TOKEN_STRING));
		LOGGER.info("Checking for taken from user. Token: " + headers.get(TOKEN_STRING));
		if (headers.get(TOKEN_STRING) == null || headers.get(TOKEN_STRING).isEmpty()) {
			LOGGER.info("*** NO TOKEN! ***");
			headers.add("Content-type", "application/json");
			return ResponseEntity.status(HttpStatus.FORBIDDEN).headers(headers).body(listOfHumanReviewItems);
		}

		String tokenHeader = headers.get(TOKEN_STRING).get(0);
		if (commonUtil.tokenValidator(tokenHeader)) {
			// Found and returning list
			listOfHumanReviewItems = hrRepo.findAll();

			headers.add("Content-type", "application/json");
			return ResponseEntity.ok().headers(headers).body(listOfHumanReviewItems);
		} else {// token was not found
			LOGGER.info("*** INVALID TOKEN! ***");
			headers.add("Content-type", "application/json");
			return ResponseEntity.status(HttpStatus.FORBIDDEN).headers(headers).body(listOfHumanReviewItems);
		}
	}

	@HystrixCommand
	public ResponseEntity<Void> humanreviewStixIdFieldPut(HttpHeaders headers, String stixId, String field,
			String originalValue, String acceptedValue, String fieldLocation, String actionType) {

		LOGGER.info(
				"*** headers {}\nstixId {}\nfield {}\noriginalValue {}\nacceptedValue {}\nfieldLocation {}\nactionType {}",
				headers, stixId, field, originalValue, acceptedValue, fieldLocation, actionType);
		HumanReviewItem hrItem = hrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation);
		String redactValue = "#####";
		LOGGER.info("id = " + stixId);
		LOGGER.info("field = " + field);
		LOGGER.info("fieldname = " + fieldLocation);

		if (headers.get(TOKEN_STRING) == null || headers.get(TOKEN_STRING).isEmpty()) {
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}

		String tokenHeader = headers.get(TOKEN_STRING).get(0);
		if (commonUtil.tokenValidator(tokenHeader)) {
			if (hrItem == null) {
				return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
			} else {
				switch (actionType) {
				case "Confirm Risk":
					hrItem.setAction(CONFIRM_RISK);
					hrItem.setStatus("Confirmed");					
					hrItem.setModifiedDate(OffsetDateTime.now());
					hrItem.setFieldValue(acceptedValue);
					hrRepo.save(hrItem);
					return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);
				case "Edit":
					hrItem.setAction(EDIT);
					hrItem.setModifiedDate(OffsetDateTime.now());
					hrItem.setFieldValue(acceptedValue);
					hrItem.setStatus("Edited");
					hrRepo.save(hrItem);
					return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);
				case "Not PII":
					hrItem.setAction(NOT_PII);
					hrItem.setStatus("Not PII");
					hrItem.setModifiedDate(OffsetDateTime.now());
					hrItem.setFieldValue(acceptedValue);
					hrRepo.save(hrItem);
					return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);
				case "Redact":
					hrItem.setFieldValue(redactValue);
					hrItem.setModifiedDate(OffsetDateTime.now());
					hrItem.setAction(REDACT);
					hrItem.setStatus("Redacted");
					hrRepo.save(hrItem);
					return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);
				default:
					return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
				}

			}
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}
	}

	@Transactional
	@HystrixCommand
	public ResponseEntity<Void> humanreviewStixIdPut(
			@ApiParam(value = "The ID of the STIX document", required = true) @RequestHeader HttpHeaders headers,
			@PathVariable("stix_id") String stixId,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "group_action", required = true) String groupAction) {
		LOGGER.info("Entering group put with id = " + stixId);
		ListOfHumanReviewItems aList = hrRepo.findByStixId(stixId);
		JsonData jsonData = jsonDataRepo.findByStixId(stixId);

		if (headers.get(TOKEN_STRING) == null || headers.get(TOKEN_STRING).isEmpty()) {
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}

		String tokenHeader = headers.get(TOKEN_STRING).get(0);
		if (commonUtil.tokenValidator(tokenHeader)) {
			if (groupAction == null) {
				return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
			} else {
				switch (groupAction) {
				case "Accept All":
					for (int i = 0; i < aList.size(); i++) {
						LOGGER.info("aList.size = " + aList.size());
						LOGGER.info("FieldLocation = " + aList.get(i).getFieldLocation());
						LOGGER.info("FieldValue = " + aList.get(i).getFieldValue());
						LOGGER.info("StixId = " + aList.get(i).getStixId());
						LOGGER.info("Made it pass updateJson!" );
						if (aList.get(i).getStatus().equals("New")) {
							aList.get(i).setStatus("Accepted");
							hrRepo.save(aList.get(i));
							LOGGER.info("Accepted value" );
						}

						LOGGER.info("ModifiedJson = " + jsonData.getModifiedJson());
					}
					
					String jsonString = jsonData.getModifiedJson();
					LOGGER.info("jsonData = " + jsonData);
					LOGGER.info("jsonString = " + jsonString);
					jsonData.setModifiedJson(jsonString);
					jsonDataRepo.save(jsonData);
					return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);

				case "Disseminate":
					return disseminate(aList, jsonData);

				case "Do Not Disseminate":
					// Remove the HumanReviewItems from the HumanreviewRepository
					aList.stream().forEach(hrItem -> {
						LOGGER.info("HR Item: " + hrItem);
						hrRepo.delete(hrItem);
					});

					return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);

				default:
					return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
				}
			}
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}

	}

	@HystrixCommand
	public ResponseEntity<String> humanreviewStixIdPost(HttpHeaders headers, HumanReviewItem hrItem) {

		if (headers.get(TOKEN_STRING) == null || headers.get(TOKEN_STRING).isEmpty()) {
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}

		String tokenHeader = headers.get(TOKEN_STRING).get(0);
		if (commonUtil.tokenValidator(tokenHeader)) {
			if (hrItem == null) {
				return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
			} else {
				LOGGER.info("Before adding date = " + hrItem);
				hrItem.setModifiedDate(OffsetDateTime.now());
				hrItem.setOriginalDate(OffsetDateTime.now());
				LOGGER.info("After adding date = " + hrItem);

				hrRepo.save(hrItem);

				return ResponseEntity.status(HttpStatus.OK).body(" New record created " + hrItem.getStixId());
			}
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}
	}

	private ResponseEntity<Void> disseminate(ListOfHumanReviewItems aList, JsonData jsonData) {
		LOGGER.info("disseminating list {} and jsonData {}", aList, jsonData);

		boolean readyToDisseminate = true;
		for (int i = 0; i < aList.size(); i++) {
			if (aList.get(i).getStatus().equals("New")) {
				readyToDisseminate = false;
				break;
			}
		}
		LOGGER.info("ready to disseminate {}", readyToDisseminate);
		if (!readyToDisseminate) {
			LOGGER.info("**** Not ready to disseminate!");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}

		aList.stream().forEach(hrItem -> {
			LOGGER.info("HR Item: " + hrItem);
			jsonDataRepo.updateJson(hrItem.getFieldLocation(), hrItem.getFieldValue(), hrItem.getStixId());
		});

		//TODO Replace this line of code
		//em.refresh(jsonData);
		jsonDataRepo.save(jsonData);
		try {
			JSONObject jsonDoc = new JSONObject(jsonData.getModifiedJson());
			String stixDoc = jsonDoc.toString(2);

			LOGGER.info("Sending ...: " + stixDoc);
			sender.sendMessage(stixDoc);
		} catch (JSONException e) {
			return new ResponseEntity<Void>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

		// Remove the jsonData from the JsonData database
		jsonDataRepo.delete(jsonData);

		// Remove the HumanReviewItems from the HumanReview database
		aList.stream().forEach(hrItem -> {
			LOGGER.info("HR Item: " + hrItem);
			hrRepo.delete(hrItem);
		});

		return new ResponseEntity<>(org.springframework.http.HttpStatus.OK);
	}

	/**
	 * Circuit Break response if the system goes down/is overloaded.
	 * 
	 * @return The Bandwidth Limit Exceeded HTTP Status code along with same message
	 *         in body
	 */
	public ResponseEntity<Void> fallback() {
		return new ResponseEntity<>(HttpStatus.BANDWIDTH_LIMIT_EXCEEDED);
	}

	public HumanreviewRepository getHrRepo() {
		return hrRepo;
	}

	public void setHrRepo(HumanreviewRepository hrRepo) {
		this.hrRepo = hrRepo;
	}

	public JsonDataRepository getJsonDataRepo() {
		return jsonDataRepo;
	}

	public void setJsonDataRepo(JsonDataRepository jsonDataRepo) {
		this.jsonDataRepo = jsonDataRepo;
	}

	public CommonUtil getCommonUtil() {
		return commonUtil;
	}

	public void setCommonUtil(CommonUtil commonUtil) {
		this.commonUtil = commonUtil;
	}

	public void setSender(Sender sender) {
		this.sender = sender;
	}

	public HumanReviewItem getHumanReviewItemByStixIdAndFieldLocation(String stixId, String fieldLocation) {
		return hrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation);
	}

	public JsonData getJsonDataByStixId(String stixId) {
		return jsonDataRepo.findByStixId(stixId);
	}

}
