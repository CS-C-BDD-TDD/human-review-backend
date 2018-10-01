package org.openapitools.api.impl;

import org.openapitools.api.HumanreviewApi;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@RestController
public class HumanreviewApiImpl implements HumanreviewApi {
	@Override
	@ApiOperation(value = "", nickname = "humanreviewPendingGet", notes = "", response = ListOfHumanReviewItems.class, tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK", response = ListOfHumanReviewItems.class) })
	@RequestMapping(value = "/humanreview/pending", produces = { "application/json" }, method = RequestMethod.GET)
	public ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet() {
		System.out.println(" entering ....");

		ListOfHumanReviewItems listOfHumanReviewItems = new ListOfHumanReviewItems();
		HumanReviewItem hrItem1 = new HumanReviewItem();
		hrItem1.setStixId(42412345);

		listOfHumanReviewItems.add(hrItem1);
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/json");
		return ResponseEntity.accepted().headers(headers).body(listOfHumanReviewItems);
	}
}
