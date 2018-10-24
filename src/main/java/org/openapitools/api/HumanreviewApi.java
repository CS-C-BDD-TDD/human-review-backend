/**
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech) (3.2.3).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */
package org.openapitools.api;

import java.util.Optional;

import javax.validation.Valid;

import org.openapitools.model.APIOptionsResultList;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@Validated
@Api(value = "humanreview", description = "the humanreview API")
public interface HumanreviewApi {

    default Optional<NativeWebRequest> getRequest() {
        return Optional.empty();
    }

    @ApiOperation(value = "", nickname = "humanreviewPendingGet", notes = "", response = ListOfHumanReviewItems.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "OK", response = ListOfHumanReviewItems.class) })
    @RequestMapping(value = "/humanreview/pending",
        produces = { "application/json" }, 
        method = RequestMethod.GET)
    default ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet(@RequestHeader HttpHeaders headers) {
        getRequest().ifPresent(request -> {
            for (MediaType mediaType: MediaType.parseMediaTypes(request.getHeader("Accept"))) {
                if (mediaType.isCompatibleWith(MediaType.valueOf("application/json"))) {
                    ApiUtil.setExampleResponse(request, "application/json", "null");
                    break;
                }
            }
        });
        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);

    }


    @ApiOperation(value = "Return endpoint API documents", nickname = "humanreviewPendingOptions", notes = "When requested, this endpoint/verb combination returns documentation explainin how this API endpoint works", response = APIOptionsResultList.class, tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "OK", response = APIOptionsResultList.class) })
    @RequestMapping(value = "/humanreview/pending",
        produces = { "application/json" }, 
        method = RequestMethod.OPTIONS)
    default ResponseEntity<APIOptionsResultList> humanreviewPendingOptions() {
        getRequest().ifPresent(request -> {
            for (MediaType mediaType: MediaType.parseMediaTypes(request.getHeader("Accept"))) {
                if (mediaType.isCompatibleWith(MediaType.valueOf("application/json"))) {
                    ApiUtil.setExampleResponse(request, "application/json", "{  \"DELETE\" : {    \"description\" : \"description\",    \"parameters\" : {      \"description\" : \"description\",      \"type\" : \"type\",      \"required\" : true    },    \"example\" : \"{}\"  },  \"POST\" : {    \"description\" : \"description\",    \"parameters\" : {      \"description\" : \"description\",      \"type\" : \"type\",      \"required\" : true    },    \"example\" : \"{}\"  },  \"GET\" : {    \"description\" : \"description\",    \"parameters\" : {      \"description\" : \"description\",      \"type\" : \"type\",      \"required\" : true    },    \"example\" : \"{}\"  },  \"OPTIONS\" : {    \"description\" : \"description\",    \"parameters\" : {      \"description\" : \"description\",      \"type\" : \"type\",      \"required\" : true    },    \"example\" : \"{}\"  },  \"PUT\" : {    \"description\" : \"description\",    \"parameters\" : {      \"description\" : \"description\",      \"type\" : \"type\",      \"required\" : true    },    \"example\" : \"{}\"  }}");
                    break;
                }
            }
        });
        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);

    }


    @ApiOperation(value = "", nickname = "humanreviewStixIdFieldPut", notes = "update to support individual review", tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "OK") })
    @RequestMapping(value = "/humanreview/{stix_id}/{field}",
        consumes = { "application/x-www-form-urlencoded" },
        method = RequestMethod.PUT)
    default ResponseEntity<Void> humanreviewStixIdFieldPut(@RequestHeader HttpHeaders headers, @ApiParam(value = "The unique identifier of the STIX document",required=true) @PathVariable("stix_id") String stixId,@ApiParam(value = "The field to be updated",required=true) @PathVariable("field") String field,@ApiParam(value = "", required=true, defaultValue="null") @RequestParam(value="original_value", required=true)  String originalValue,@ApiParam(value = "", required=true, defaultValue="null") @RequestParam(value="accepted_value", required=true)  String acceptedValue,@ApiParam(value = "", required=true, defaultValue="null") @RequestParam(value="field_name", required=true)  String fieldName,@ApiParam(value = "", required=true, defaultValue="null") @RequestParam(value="action_type", required=true)  String actionType) {
        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);

    }


    @ApiOperation(value = "", nickname = "humanreviewStixIdPut", notes = "", tags={  })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "OK") })
    @RequestMapping(value = "/humanreview/{stix_id}",
        consumes = { "application/x-www-form-urlencoded" },
        method = RequestMethod.PUT)
    default ResponseEntity<Void> humanreviewStixIdPut(@ApiParam(value = "The ID of the STIX document",required=true) @PathVariable("stix_id") String stixId) {
        return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);

    }
    
    @ApiOperation(value = "", nickname = "humanreviewPost", notes = "", response = String.class, tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK", response = String.class) })
	@RequestMapping(value = "/humanreview/{stix_id}", produces = { "text/plain" }, consumes = {
			"application/json" }, method = RequestMethod.POST)
	default ResponseEntity<String> humanreviewStixIdPost(
			@ApiParam(value = "Allow the user to create a HR item", required = true) @Valid @RequestBody HumanReviewItem hrItem) {
		return new ResponseEntity<>(HttpStatus.NOT_IMPLEMENTED);

	}

}
