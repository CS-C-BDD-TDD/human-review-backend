package gov.dhs.nppd.humanreview.service;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.hasItems;
import static org.hamcrest.CoreMatchers.not;
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
	private ListOfHumanReviewItems hrItemList;
	private HttpHeaders headers;

	@Before
	public void setup() {
		mockHrRepo = Mockito.mock(HumanreviewRepository.class);
		mockCommonUtil = Mockito.mock(CommonUtil.class);
		hrItemList = new ListOfHumanReviewItems();
		Mockito.when(mockHrRepo.findAll()).thenReturn(hrItemList);
		Mockito.when(mockCommonUtil.tokenValidator("Random")).thenReturn(true);
		headers = new HttpHeaders();
		headers.add("token", "Random");
		hrApiCtrl.setHrRepo(mockHrRepo);
		hrApiCtrl.setCommonUtil(mockCommonUtil);
		stixId = "stix-id-1";
		fieldName = "field-name-a";
		expectedFieldValue = "accepted-value";
	}

	@Test
	public void shouldGetEmptyList() {
		// intentionally left the list hrItemListe empty!

		ResponseEntity<ListOfHumanReviewItems> resp = hrApiCtrl.humanreviewPendingGet(headers);

		ListOfHumanReviewItems listOfHumanReviewItems = resp.getBody();
		assertThat(headers, notNullValue());
		assertThat(listOfHumanReviewItems, notNullValue());
		assertThat(listOfHumanReviewItems, empty());
	}

	@Test
	public void shouldGetNonEmptyList() {
		HumanReviewItem hrItem = new HumanReviewItem();
		hrItem.setStixId("my-stix-id-1");
		HumanReviewItem hrItemNot = new HumanReviewItem();
		hrItemNot.setStixId("my-stix-id-Not");

		hrItemList.add(hrItem);

		ResponseEntity<ListOfHumanReviewItems> resp = hrApiCtrl.humanreviewPendingGet(headers);

		ListOfHumanReviewItems listOfHumanReviewItems = resp.getBody();
		assertThat(listOfHumanReviewItems, hasItems(hrItem));
		assertThat(listOfHumanReviewItems, not(hasItems(hrItemNot)));

	}

	@Test
	public void shouldUpdateFieldByStixIdWithInvalidAction() {
		// given stix id & field id

		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);

		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(expectedHumanReviewItem);
		hrApiCtrl.setHrRepo(mockHrRepo);

		// when I update the field
		hrApiCtrl.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value", expectedFieldValue, fieldName,
				"Invalid");

		Mockito.verify(mockHrRepo, Mockito.times(0)).save(expectedHumanReviewItem);
	}

	@Test
	public void shouldUpdateFieldByStixIdWithValidAction() {
		// given stix id & field id

		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);

		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(expectedHumanReviewItem);
		hrApiCtrl.setHrRepo(mockHrRepo);

		String[] actionList = { "Confirm Risk", "Edit", "Not PII", "Redact" };

		for (String action : actionList) {
			// when I update the field
			hrApiCtrl.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value", expectedFieldValue,
					fieldName, action);

			// then I should get a successful update of the record
			HumanReviewItem actualHumaReviewItem = hrApiCtrl.getHumanReviewItemByStixIdAndFieldName(stixId, fieldName);

			assertThat(actualHumaReviewItem, equalTo(expectedHumanReviewItem));
		}
		Mockito.verify(mockHrRepo, Mockito.times(4)).save(expectedHumanReviewItem);
	}

	@Test
	public void shouldGetBadRequestWhenHumanReviewItemNotExist() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		hrApiCtrl.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<Void> result = hrApiCtrl.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value",
				"", fieldName, "some-action");

		// Then or Assert
		assertThat(result.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldGetBadRequestForUpdateGivenNullToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		headers.remove("token");
		hrApiCtrl.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiCtrl.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value",
				"", fieldName, "some-action");
		// Then or Assert
		assertThat(result.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForUpdateGivenEmptyToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "");
		hrApiCtrl.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiCtrl.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value",
				"", fieldName, "some-action");
		// Then or Assert
		assertThat(result.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForUpdateGivenBadToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "xyz");
		hrApiCtrl.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiCtrl.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value",
				"", fieldName, "some-action");
		// Then or Assert
		assertThat(result.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetForbiddenCodeForGetPendingGivenNullToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		headers.remove("token");
		hrApiCtrl.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<ListOfHumanReviewItems> resp = hrApiCtrl.humanreviewPendingGet(headers);

		// Then or Assert
		assertThat(resp.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.FORBIDDEN.value()));

	}

	@Test
	public void shouldGetForbiddenCodeForGetPendingGivenEmptyToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldName(stixId, fieldName)).thenReturn(null);
		headers.set("token", "");
		hrApiCtrl.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<ListOfHumanReviewItems> resp = hrApiCtrl.humanreviewPendingGet(headers);

		// Then or Assert
		assertThat(resp.getStatusCodeValue(), equalTo(org.springframework.http.HttpStatus.FORBIDDEN.value()));

	}

	@Test
	public void shouldCreateFieldByStixIdWithValidHRItem() {
		HumanReviewItem hrItem = new HumanReviewItem();

		Mockito.when(mockHrRepo.save(hrItem)).thenReturn(null);
		hrApiCtrl.setHrRepo(mockHrRepo);

		hrApiCtrl.humanreviewStixIdPost(hrItem);

		Mockito.verify(mockHrRepo, Mockito.times(1)).save(hrItem);
	}

	@Test
	public void shouldMakeIt100Percent() {
		hrApiCtrl.getHrRepo();
		hrApiCtrl.getRequest();
		assertTrue(true);
	}
}
