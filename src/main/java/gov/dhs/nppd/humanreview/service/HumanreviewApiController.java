package gov.dhs.nppd.humanreview.service;

import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.http.HttpStatus;
import org.openapitools.api.HumanreviewApi;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.HumanReviewItem.ActionEnum;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.HumanreviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
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

	private final NativeWebRequest request;
	private static final Logger LOGGER = LogManager.getLogger(HumanreviewApiController.class);
	
	@org.springframework.beans.factory.annotation.Autowired
	public HumanreviewApiController(NativeWebRequest request, HumanreviewRepository hrRepo) {
		this.request = request;
		hrRepo = hrRepo;
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

	@Override
	@ApiOperation(value = "", nickname = "humanreviewPendingGet", notes = "", response = ListOfHumanReviewItems.class, tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK", response = ListOfHumanReviewItems.class) })
	@RequestMapping(value = "/humanreview/pending", produces = { "application/json" }, method = RequestMethod.GET)
	public ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet(@RequestHeader HttpHeaders headers) {

		ListOfHumanReviewItems listOfHumanReviewItems = new ListOfHumanReviewItems();
		// token is missing
		if (headers.get("token") == null || headers.get("token").isEmpty()) {
			headers.add("Content-type", "application/json");
			return ResponseEntity.status(HttpStatus.FORBIDDEN_403).headers(headers).body(listOfHumanReviewItems);
		}
		String tokenHeader = headers.get("token").get(0);
		if (commonUtil.tokenValidator(tokenHeader)) {
			// Found and returning list
			listOfHumanReviewItems = hrRepo.findAll();

			headers.add("Content-type", "application/json");
			return ResponseEntity.accepted().headers(headers).body(listOfHumanReviewItems);
		} else {// token was not found
			headers.add("Content-type", "application/json");
			return ResponseEntity.status(HttpStatus.FORBIDDEN_403).headers(headers).body(listOfHumanReviewItems);
		}
	}

	@ApiOperation(value = "", nickname = "humanreviewStixIdFieldPut", notes = "update to support individual review", tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK") })
	@RequestMapping(value = "/humanreview/{stix_id}/{field}", consumes = {
			"application/x-www-form-urlencoded" }, method = RequestMethod.PUT)
	public ResponseEntity<Void> humanreviewStixIdFieldPut(
			@ApiParam(value = "The unique identifier of the STIX document", required = true) @PathVariable("stix_id") String stixId,
			@ApiParam(value = "The field to be updated", required = true) @PathVariable("field") String field,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "original_value", required = true) String originalValue,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "accepted_value", required = true) String acceptedValue,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "field_name", required = true) String fieldName,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "action_type", required = true) String actionType) {

		HumanReviewItem hrItem = hrRepo.findByStixIdAndFieldName(stixId, fieldName);
		String redactValue = "#####";
		ActionEnum actionEnum = ActionEnum.CONFIRM_RISK;
		LOGGER.debug("id = " + stixId);
		LOGGER.debug("f = " + field);
		LOGGER.debug("fn = " + fieldName);
		if (hrItem == null) {
			return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
		} else {
			switch (actionType) {
			case "Confirm Risk":
				hrItem.setAction(actionEnum.CONFIRM_RISK);
				hrItem.setStatus("Confirmed");
				hrRepo.save(hrItem);
				return new ResponseEntity<Void>(org.springframework.http.HttpStatus.ACCEPTED);
			case "Edit":
				hrItem.setAction(actionEnum.EDIT);
				hrItem.setFieldValue(acceptedValue);
				hrItem.setStatus("Edited");
				hrRepo.save(hrItem);
				return new ResponseEntity<Void>(org.springframework.http.HttpStatus.ACCEPTED);
			case "Not PII":
				hrItem.setAction(actionEnum.NOT_PII);
				hrItem.setStatus("Not PII");
				hrRepo.save(hrItem);
				return new ResponseEntity<Void>(org.springframework.http.HttpStatus.ACCEPTED);
			case "Redact":
				hrItem.setFieldValue(redactValue);
				hrItem.setAction(actionEnum.REDACT);
				hrItem.setStatus("Redacted");
				hrRepo.save(hrItem);
				return new ResponseEntity<Void>(org.springframework.http.HttpStatus.ACCEPTED);
			default:
				return new ResponseEntity<>(org.springframework.http.HttpStatus.BAD_REQUEST);
			}

		}
	}

	public HumanreviewRepository getHrRepo() {
		return hrRepo;
	}

	public void setHrRepo(HumanreviewRepository hrRepo) {
		this.hrRepo = hrRepo;
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

}
