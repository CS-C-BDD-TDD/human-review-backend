package gov.dhs.nppd.humanreview.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.openapitools.api.HumanreviewApi;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.HumanreviewRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.NativeWebRequest;

import gov.dhs.nppd.humanreview.service.HumanreviewApiService;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@RestController
@SpringBootApplication
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class HumanreviewApiController implements HumanreviewApi {


	private final NativeWebRequest request;
	
	@Autowired
	HumanreviewApiService humanreviewApiService;

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}
	
	
	@org.springframework.beans.factory.annotation.Autowired
	public HumanreviewApiController(NativeWebRequest request, HumanreviewRepository hrRepo) {
		this.request = request;
	}
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
	@ApiResponses(value = {
			@ApiResponse(code = 200, message = "OK", response = ListOfHumanReviewItems.class) })
	@RequestMapping(value = "/humanreview/pending", produces = {
			"application/json" }, method = RequestMethod.GET)
	public ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet(
			@RequestHeader HttpHeaders headers) {
		
		return humanreviewApiService.humanreviewPendingGet(headers);
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
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "field_location", required = true) String fieldLocation,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "action_type", required = true) String actionType) {

		return humanreviewApiService.humanreviewStixIdFieldPut(headers, stixId, field, originalValue, acceptedValue, fieldLocation, actionType);
	}

	/**
	 * Updating an existing HR item.
	 * 
	 * @param Stix Id
	 * 
	 * @return Success with 200; failure with BAD_REQUEST (40X)
	 * 
	 */
	@Transactional
	@ApiOperation(value = "", nickname = "humanreviewStixIdPut", notes = "", tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK") })
	@RequestMapping(value = "/humanreview/{stix_id}", consumes = {
			"application/x-www-form-urlencoded" }, method = RequestMethod.PUT)
	public ResponseEntity<Void> humanreviewStixIdPut(
			@ApiParam(value = "The ID of the STIX document", required = true) @RequestHeader HttpHeaders headers,
			@PathVariable("stix_id") String stixId,
			@ApiParam(value = "", required = true, defaultValue = "null") @RequestParam(value = "group_action", required = true) String groupAction) {
		
		return humanreviewApiService.humanreviewStixIdPut(headers, stixId, groupAction);

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

		return humanreviewApiService.humanreviewStixIdPost(headers, hrItem);
	}



}
