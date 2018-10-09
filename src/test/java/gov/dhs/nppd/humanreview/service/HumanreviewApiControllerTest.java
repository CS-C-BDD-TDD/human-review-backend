package gov.dhs.nppd.humanreview.service;

import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.empty;

import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.HumanreviewRepository;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

@ComponentScan(basePackages = { "org.openapitools", "org.openapitools.api", "org.openapitools.configuration",
		"gov.dhs.nppd.humanreview", "org.openapitools.repository" })
public class HumanreviewApiControllerTest {

	HumanreviewApiController hrApiCtrl = new HumanreviewApiController(null);

	@Test
	public void shouldGetEmptyList() {
		ListOfHumanReviewItems emptyList = new ListOfHumanReviewItems();
		HumanreviewRepository mockHrRepo = Mockito.mock(HumanreviewRepository.class);
		Mockito.when(mockHrRepo.getPending()).thenReturn(emptyList);

		hrApiCtrl.setHrRepo(mockHrRepo);
		ResponseEntity<ListOfHumanReviewItems> resp = hrApiCtrl.humanreviewPendingGet();
		ListOfHumanReviewItems listOfHumanReviewItems = resp.getBody();
		HttpHeaders headers = resp.getHeaders();

		assertThat(headers, notNullValue());
		assertThat(listOfHumanReviewItems, notNullValue());
		assertThat(listOfHumanReviewItems, empty());
	}
}
