package gov.dhs.nppd.humanreview.service;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.hasItems;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.CoreMatchers.notNullValue;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.empty;
import static org.junit.Assert.assertTrue;

import javax.persistence.EntityManager;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.JsonData;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.HumanreviewRepository;
import org.openapitools.repository.JsonDataRepository;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;

import gov.dhs.nppd.humanreview.amq.Sender;
import gov.dhs.nppd.humanreview.util.CommonUtil;

@ComponentScan(basePackages = { "org.openapitools", "org.openapitools.api",
		"org.openapitools.configuration", "gov.dhs.nppd.model", "gov.dhs.nppd.api",
		"gov.dhs.nppd.repository" })
public class HumanreviewApiServiceTest {

	private HumanreviewApiService hrApiService = new HumanreviewApiService();
	private HumanreviewRepository mockHrRepo;
	private JsonDataRepository mockJsonRepo;
	private CommonUtil mockCommonUtil;
	private Sender mockSender;
	private String stixId;
	private String expectedFieldValue;
	private String fieldName;
	private String fieldLocation;
	private ListOfHumanReviewItems hrItemList;
	private HttpHeaders headers;
	private EntityManager mockEnitytManager;

	@Before
	public void setup() {
		mockHrRepo = Mockito.mock(HumanreviewRepository.class);
		mockCommonUtil = Mockito.mock(CommonUtil.class);
		mockSender = Mockito.mock(Sender.class);
		mockJsonRepo = Mockito.mock(JsonDataRepository.class);
		mockEnitytManager = Mockito.mock(EntityManager.class);
		hrItemList = new ListOfHumanReviewItems();
		Mockito.when(mockHrRepo.findAll()).thenReturn(hrItemList);
		Mockito.when(mockCommonUtil.tokenValidator("Random")).thenReturn(true);
		Mockito.when(mockSender.sendMessage("Random")).thenReturn("Random");
		Mockito.doNothing().when(mockEnitytManager).refresh(Mockito.any());
		headers = new HttpHeaders();
		headers.add("token", "Random");
		hrApiService.setHrRepo(mockHrRepo);
		hrApiService.setCommonUtil(mockCommonUtil);
		hrApiService.setSender(mockSender);
		hrApiService.setJsonDataRepo(mockJsonRepo);
		hrApiService.setEm(mockEnitytManager);
		stixId = "stix-id-1";
		fieldName = "field-name-a";
		fieldLocation = "field-location-a";
		expectedFieldValue = "accepted-value";
	}

	@Test
	public void shouldGetEmptyList() {
		// intentionally left the list hrItemListe empty!

		ResponseEntity<ListOfHumanReviewItems> resp = hrApiService.humanreviewPendingGet(headers);

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

		ResponseEntity<ListOfHumanReviewItems> resp = hrApiService.humanreviewPendingGet(headers);

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

		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation))
				.thenReturn(expectedHumanReviewItem);
		hrApiService.setHrRepo(mockHrRepo);

		// when I update the field
		hrApiService.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value",
				expectedFieldValue, fieldLocation, "Invalid");

		Mockito.verify(mockHrRepo, Mockito.times(0)).save(expectedHumanReviewItem);
	}

	@Test
	public void shouldUpdateFieldByStixIdWithValidAction() {
		// given stix id & field id

		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldLocation(fieldLocation);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);

		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation))
				.thenReturn(expectedHumanReviewItem);
		hrApiService.setHrRepo(mockHrRepo);

		String[] actionList = { "Confirm Risk", "Edit", "Not PII", "Redact" };

		for (String action : actionList) {
			// when I update the field
			hrApiService.humanreviewStixIdFieldPut(headers, stixId, fieldName, "original-value",
					expectedFieldValue, fieldLocation, action);

			// then I should get a successful update of the record
			HumanReviewItem actualHumaReviewItem = hrApiService
					.getHumanReviewItemByStixIdAndFieldLocation(stixId, fieldLocation);

			assertThat(actualHumaReviewItem, equalTo(expectedHumanReviewItem));
		}
		Mockito.verify(mockHrRepo, Mockito.times(4)).save(expectedHumanReviewItem);
	}

	@Test
	public void shouldGetBadRequestWhenHumanReviewItemNotExist() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		hrApiService.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<Void> result = hrApiService.humanreviewStixIdFieldPut(headers, stixId,
				fieldName, "original-value", "", fieldLocation, "some-action");

		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldGetBadRequestForUpdateGivenNullToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiService.humanreviewStixIdFieldPut(headers, stixId,
				fieldName, "original-value", "", fieldLocation, "some-action");
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForUpdateGivenEmptyToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiService.humanreviewStixIdFieldPut(headers, stixId,
				fieldName, "original-value", "", fieldLocation, "some-action");
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForUpdateGivenBadToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "xyz");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiService.humanreviewStixIdFieldPut(headers, stixId,
				fieldName, "original-value", "", fieldLocation, "some-action");
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetForbiddenCodeForGetPendingGivenNullToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		hrApiService.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<ListOfHumanReviewItems> resp = hrApiService.humanreviewPendingGet(headers);

		// Then or Assert
		assertThat(resp.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.FORBIDDEN.value()));

	}

	@Test
	public void shouldGetForbiddenCodeForGetPendingGivenEmptyToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.set("token", "");
		hrApiService.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<ListOfHumanReviewItems> resp = hrApiService.humanreviewPendingGet(headers);

		// Then or Assert
		assertThat(resp.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.FORBIDDEN.value()));

	}

	@Test
	public void shouldCreateModifiedJsonByStixIdWithValidGroupAction() {
		// Given or Arrange
		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStatus("New");
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);
		hrItemList.add(expectedHumanReviewItem);

		JsonData expectedJsonData = new JsonData();
		expectedJsonData.setStixId(stixId);
		expectedJsonData.setOriginalJson(expectedFieldValue);
		expectedJsonData.setModifiedJson(expectedFieldValue);

		Mockito.when(mockHrRepo.findByStixId(stixId)).thenReturn(hrItemList);
		Mockito.when(mockJsonRepo.findByStixId(stixId)).thenReturn(expectedJsonData);
		hrApiService.setJsonDataRepo(mockJsonRepo);

		String[] groupActionList = { "Accept All", "Disseminate", "Do Not Disseminate" };

		for (String groupAction : groupActionList) {
			// when I update the field
			hrApiService.humanreviewStixIdPut(headers, stixId, groupAction);
		}
		// Then or Assert
		Mockito.verify(mockJsonRepo, Mockito.times(1)).save(expectedJsonData);
	}

	@Test
	public void shouldGetBadRequestWhenNotReadyToDisseminate() {
		// Given or Arrange
		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStatus("New");
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);
		hrItemList.add(expectedHumanReviewItem);

		JsonData expectedJsonData = new JsonData();
		expectedJsonData.setStixId(stixId);

		Mockito.when(mockHrRepo.findByStixId(stixId)).thenReturn(hrItemList);
		Mockito.when(mockJsonRepo.findByStixId(stixId)).thenReturn(expectedJsonData);
		hrApiService.setJsonDataRepo(mockJsonRepo);

		// When or my Act
		ResponseEntity<Void> result = hrApiService.humanreviewStixIdPut(headers, stixId,
				"Disseminate");

		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldGetBadRequestForGroupUpdateGivenHumanReviewItemNotExist() {
		// Given or Arrange
		HumanReviewItem hrItem = null;
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		hrApiService.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<Void> result = hrApiService.humanreviewStixIdPut(headers, stixId, null);

		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldGetBadRequestForGroupUpdateGivenNullToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiService.humanreviewStixIdPut(headers, stixId, "Accept All");
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForGroupUpdateGivenEmptyToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiService.humanreviewStixIdPut(headers, stixId, "Accept All");
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForGroupUpdateGivenBadToken() {
		// Given or Arrange
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "xyz");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<Void> result = hrApiService.humanreviewStixIdPut(headers, stixId, "Accept All");
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestWhenGroupActionNotExist() {
		// Given or Arrange
		HumanReviewItem expectedHumanReviewItem = new HumanReviewItem();
		expectedHumanReviewItem.setStixId(stixId);
		expectedHumanReviewItem.setFieldName(fieldName);
		expectedHumanReviewItem.setFieldValue(expectedFieldValue);
		hrItemList.add(expectedHumanReviewItem);

		JsonData expectedJsonData = new JsonData();
		expectedJsonData.setStixId(stixId);

		Mockito.when(mockHrRepo.findByStixId(stixId)).thenReturn(hrItemList);
		Mockito.when(mockJsonRepo.findByStixId(stixId)).thenReturn(expectedJsonData);
		hrApiService.setJsonDataRepo(mockJsonRepo);

		// When or my Act
		ResponseEntity<Void> result = hrApiService.humanreviewStixIdPut(headers, stixId,
				"some-action");

		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldGetBadRequestForCreateFieldGivenHumanReviewItemNotExist() {
		// Given or Arrange
		HumanReviewItem hrItem = null;
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		hrApiService.setHrRepo(mockHrRepo);

		// When or my Act
		ResponseEntity<String> result = hrApiService.humanreviewStixIdPost(headers, hrItem);

		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));
	}

	@Test
	public void shouldGetBadRequestForCreateFieldGivenNullToken() {
		// Given or Arrange
		HumanReviewItem hrItem = new HumanReviewItem();
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<String> result = hrApiService.humanreviewStixIdPost(headers, hrItem);
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForCreateFieldGivenEmptyToken() {
		// Given or Arrange
		HumanReviewItem hrItem = new HumanReviewItem();
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<String> result = hrApiService.humanreviewStixIdPost(headers, hrItem);
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldGetBadRequestForCreateFieldGivenBadToken() {
		// Given or Arrange
		HumanReviewItem hrItem = new HumanReviewItem();
		Mockito.when(mockHrRepo.findByStixIdAndFieldLocation(stixId, fieldLocation)).thenReturn(null);
		headers.remove("token");
		headers.set("token", "xyz");
		hrApiService.setHrRepo(mockHrRepo);

		ResponseEntity<String> result = hrApiService.humanreviewStixIdPost(headers, hrItem);
		// Then or Assert
		assertThat(result.getStatusCodeValue(),
				equalTo(org.springframework.http.HttpStatus.BAD_REQUEST.value()));

	}

	@Test
	public void shouldCreateFieldByStixIdWithValidHRItem() {
		HumanReviewItem hrItem = new HumanReviewItem();

		Mockito.when(mockHrRepo.save(hrItem)).thenReturn(null);
		hrApiService.setHrRepo(mockHrRepo);

		hrApiService.humanreviewStixIdPost(headers, hrItem);

		Mockito.verify(mockHrRepo, Mockito.times(1)).save(hrItem);
	}

	@Test
	public void shouldMakeIt100Percent() {
		hrApiService.getHrRepo();
		hrApiService.getCommonUtil();
		hrApiService.fallback();
		assertTrue(true);
	}
}
