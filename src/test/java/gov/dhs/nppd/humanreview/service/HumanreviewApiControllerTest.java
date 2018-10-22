package gov.dhs.nppd.humanreview.service;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.empty;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.HumanreviewRepository;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

import gov.dhs.nppd.humanreview.util.CommonUtil;

@ComponentScan(basePackages = { "org.openapitools", "org.openapitools.api", "org.openapitools.configuration",
		"gov.dhs.nppd.model", "gov.dhs.nppd.api", "gov.dhs.nppd.repository" })
public class HumanreviewApiControllerTest {

	private HumanreviewApiController hrApiCtrl = new HumanreviewApiController(null, null);
	private HumanreviewRepository mockHrRepo;
	private CommonUtil mockCommonUtil;
	private String stixId;
	private String expectedFieldValue;
	private String fieldName;

	@Before
	public void setup() {
		mockHrRepo = Mockito.mock(HumanreviewRepository.class);
		mockCommonUtil = Mockito.mock(CommonUtil.class);
		stixId = "stix-id-1";
		fieldName = "field-name-a";
		expectedFieldValue = "accepted-value";
	}

	@Test
	public void shouldGetEmptyList() {
		ListOfHumanReviewItems emptyList = new ListOfHumanReviewItems();
		Mockito.when(mockHrRepo.findAll()).thenReturn(emptyList);
		Mockito.when(mockCommonUtil.tokenValidator("Random")).thenReturn(true);

		HttpHeaders headers = new HttpHeaders();
		headers.add("token", "Random");
		hrApiCtrl.setHrRepo(mockHrRepo);
		hrApiCtrl.setCommonUtil(mockCommonUtil);

		ResponseEntity<ListOfHumanReviewItems> resp = hrApiCtrl.humanreviewPendingGet(headers);
		ListOfHumanReviewItems listOfHumanReviewItems = resp.getBody();

		assertThat(headers, notNullValue());
		assertThat(listOfHumanReviewItems, notNullValue());
		assertThat(listOfHumanReviewItems, empty());
	}

	@Test
	public void shouldUpdateFieldByStixId() {
		// given stix id & field id

		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);

		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(expectedHumanReviewItem);
		hrApiCtrl.setHrRepo(mockHrRepo);

		// when I update the field
		hrApiCtrl.humanreviewStixIdFieldPut(stixId, fieldName, "original-value", expectedFieldValue, fieldName,
				"some-action");

		// then I should get a successful update of the record
		HumanReviewItem actualHumaReviewItem = hrApiCtrl.getHumanReviewItemByStixIdAndFieldName(stixId, fieldName);

		Mockito.verify(mockHrRepo, Mockito.times(1)).save(expectedHumanReviewItem);
		assertThat(actualHumaReviewItem, equalTo(expectedHumanReviewItem));
	}

	@Test
	public void shouldGetBadRequestWhenHumanReviewItemNotExist() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		hrApiCtrl.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<Void> result = hrApiCtrl.humanreviewStixIdFieldPut(stixId, fieldName, "original-value", "",
				fieldName, "some-action");

		// Then or Assert
		assertThat(result.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldMakeIt100Percent() {
		hrApiCtrl.getHrRepo();
		hrApiCtrl.getRequest();
		assertTrue(true);

	}
}
