package gov.dhs.nppd.humanreview.service;

import java.time.OffsetDateTime;
import java.util.Optional;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.http.HttpStatus;
import org.openapitools.api.HumanreviewApi;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.HumanReviewItem.ActionEnum;
import org.openapitools.model.JsonData;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.HumanreviewRepository;
import org.openapitools.repository.JsonDataRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;

import gov.dhs.nppd.humanreview.util.CommonUtil;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class HumanreviewApiController implements HumanreviewApi {

	private static final String TOKEN_STRING = "token";
	private final NativeWebRequest request;
	private static final Logger LOGGER = LogManager.getLogger(HumanreviewApiController.class);

	@org.springframework.beans.factory.annotation.Autowired
	public HumanreviewApiController(NativeWebRequest request, HumanreviewRepository hrRepo) {
		this.request = request;
	}

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}

	//
	@Autowired
	private HumanreviewRepository hrRepo;

	@Autowired
	private CommonUtil commonUtil;

	@Autowired
	private JsonDataRepository jsonDataRepo;

	/**
	 * Get HR item pending list
	 * 
	 * URL: /humanreview/pending
	 * 
	 * @param HTTP headers with content-type of application/json
	 * @param HTTP headers with token = authentication token.
	 * 
	 * @return when success: a list of HR items pending with 200 when fail: return
	 *         403
	 */
	@Override
	@ApiOperation(value = "", nickname = "humanreviewPendingGet", notes = "", response = ListOfHumanReviewItems.class, tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK", response = ListOfHumanReviewItems.class) })
	@RequestMapping(value = "/humanreview/pending", produces = { "application/json" }, method = RequestMethod.GET)
	public ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet(@RequestHeader HttpHeaders headers) {

		ListOfHumanReviewItems listOfHumanReviewItems = new ListOfHumanReviewItems();

		LOGGER.debug("token: " + headers.get(TOKEN_STRING));
		LOGGER.info("Checking for taken from user. Token: " + headers.get(TOKEN_STRING));
		if (headers.get(TOKEN_STRING) == null || headers.get(TOKEN_STRING).isEmpty()) {
			headers.add("Content-type", "application/json");
			return ResponseEntity.status(HttpStatus.FORBIDDEN_403).headers(headers).body(listOfHumanReviewItems);
		}

		String tokenHeader = headers.get(TOKEN_STRING).get(0);
		if (commonUtil.tokenValidator(tokenHeader)) {
			// Found and returning list
			listOfHumanReviewItems = hrRepo.findAll();

			headers.add("Content-type", "application/json");
			return ResponseEntity.ok().headers(headers).body(listOfHumanReviewItems);
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return ResponseEntity.status(HttpStatus.FORBIDDEN_403).headers(headers).body(listOfHumanReviewItems);
		}
	}

	/**
	 * Updating an existing HR item.
	 * 
	 * @param Stix      Id
	 * @param fieldname
	 * @param orginial  value
	 * @param accepted  value
	 * @param action    type (Confirm Risk, not PII, Edit, Redact"
	 * 
	 * @return Success with 200; failure with BAD_REQUEST (40X)
	 * 
	 */
	@ApiOperation(value = "", nickname = "humanreviewStixIdFieldPut", notes = "update to support individual review", tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK") })
	@RequestMapping(value = "/humanreview/{stix_id}/{field}", consumes = {
			"application/x-www-form-urlencoded" }, method = RequestMethod.PUT)
	public ResponseEntity<Void> humanreviewStixIdFieldPut(@RequestHeader HttpHeaders headers,
			@ApiParam(value = "The unique identifier of the STIX document", required = true) @PathVariable("stix_id") String stixId,
			@ApiParam(value = "The field to be updated", required = true) @PathVariable("field") String field,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "original_value", required = true) String originalValue,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "accepted_value", required = true) String acceptedValue,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "field_name", required = true) String fieldName,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "action_type", required = true) String actionType) {

		HumanReviewItem hrItem = hrRepo.findByStixIdAndFieldName(stixId, fieldName);
		String redactValue = "#####";
		ActionEnum actionEnum = ActionEnum.CONFIRM_RISK;
		LOGGER.info("id = " + stixId);
		LOGGER.info("field = " + field);
		LOGGER.info("fieldname = " + fieldName);

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
					hrItem.setAction(actionEnum.CONFIRM_RISK);
					hrItem.setStatus("Confirmed");
					hrRepo.save(hrItem);
					return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
				case "Edit":
					hrItem.setAction(actionEnum.EDIT);
					hrItem.setModifiedDate(OffsetDateTime.now());
					hrItem.setFieldValue(acceptedValue);
					hrItem.setStatus("Edited");
					hrRepo.save(hrItem);
					return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
				case "Not PII":
					hrItem.setAction(actionEnum.NOT_PII);
					hrItem.setStatus("Not PII");
					hrRepo.save(hrItem);
					return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
				case "Redact":
					hrItem.setFieldValue(redactValue);
					hrItem.setModifiedDate(OffsetDateTime.now());
					hrItem.setAction(actionEnum.REDACT);
					hrItem.setStatus("Redacted");
					hrRepo.save(hrItem);
					return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
				default:
					return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
				}

			}
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}
	}

	/**
	 * Updating an existing HR item.
	 * 
	 * @param Stix Id
	 * 
	 * @return Success with 200; failure with BAD_REQUEST (40X)
	 * 
	 */
	@ApiOperation(value = "", nickname = "humanreviewStixIdPut", notes = "", tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK") })
	@RequestMapping(value = "/humanreview/{stix_id}", consumes = {
			"application/x-www-form-urlencoded" }, method = RequestMethod.PUT)
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
						if (aList.get(i).getStatus().equals("New")) {
							aList.get(i).setStatus("Accepted");
						}
						LOGGER.info("Loop iteration = " + i + aList.toString());
					}
					jsonData.setModifiedJson(aList.toString());
					jsonDataRepo.save(jsonData);
					return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
				case "Disseminate":
					boolean readyToDisseminate = true;
					for (int i = 0; i < aList.size(); i++) {
						if (aList.get(i).getStatus().equals("New")) {
							readyToDisseminate = false;
						}
					}
					if (readyToDisseminate == true) {
						jsonData.setModifiedJson(aList.toString());
						jsonDataRepo.save(jsonData);
						return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);
					} else {
						return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
					}
				case "Do Not Disseminate":
					return new ResponseEntity<Void>(org.springframework.http.HttpStatus.OK);

				default:
					return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
				}
			}
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}

	}

	/**
	 * Create a HR item.
	 * 
	 * @param Human Review Item.
	 * @return String indicates a successful create with a message that includes the
	 *         stix id.
	 * @return Success of 200.
	 * 
	 */
	@ApiOperation(value = "", nickname = "humanreviewPost", notes = "", response = String.class, tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK", response = String.class) })
	@RequestMapping(value = "/humanreview/{stix_id}", consumes = {
			"application/json" }, method = RequestMethod.POST)
	public ResponseEntity<String> humanreviewStixIdPost(@RequestHeader HttpHeaders headers,
			@ApiParam(value = "Allow the user to create a HR item", required = true) @Valid @RequestBody HumanReviewItem hrItem) {
		
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

				return ResponseEntity.status(HttpStatus.OK_200).headers(headers)
				.body(" New record created " + hrItem.getStixId());
			}
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		}
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

	public HumanReviewItem getHumanReviewItemByStixIdAndFieldName(String stixId, String fieldName) {
		return hrRepo.findByStixIdAndFieldName(stixId, fieldName);
	}

	public JsonData getJsonDataByStixId(String stixId) {
		return jsonDataRepo.findByStixId(stixId);
	}

}
