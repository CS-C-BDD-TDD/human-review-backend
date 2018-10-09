package gov.dhs.nppd.humanreview.service;

import java.util.Optional;

import org.openapitools.api.HumanreviewApi;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.NativeWebRequest;

import gov.dhs.nppd.humanreview.repository.HumanreviewRepository;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;

@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-09-28T12:48:27.866-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class HumanreviewApiController implements HumanreviewApi {

	private final NativeWebRequest request;

	@Autowired
	private HumanreviewRepository hrRepo;

	@org.springframework.beans.factory.annotation.Autowired
	public HumanreviewApiController(NativeWebRequest request) {
		this.request = request;
	}

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}

	@Override
	@ApiOperation(value = "", nickname = "humanreviewPendingGet", notes = "", response = ListOfHumanReviewItems.class, tags = {})
	@ApiResponses(value = { @ApiResponse(code = 200, message = "OK", response = ListOfHumanReviewItems.class) })
	@RequestMapping(value = "/humanreview/pending", produces = { "application/json" }, method = RequestMethod.GET)
	public ResponseEntity<ListOfHumanReviewItems> humanreviewPendingGet() {
		ListOfHumanReviewItems listOfHumanReviewItems = hrRepo.getPending();
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "application/json");
		return ResponseEntity.accepted().headers(headers).body(listOfHumanReviewItems);
	}

	public HumanreviewRepository getHrRepo() {
		return hrRepo;
	}

	public void setHrRepo(HumanreviewRepository hrRepo) {
		this.hrRepo = hrRepo;
	}

	
}