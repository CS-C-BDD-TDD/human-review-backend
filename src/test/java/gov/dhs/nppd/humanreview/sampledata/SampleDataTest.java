package gov.dhs.nppd.humanreview.sampledata;

import static org.junit.Assert.assertTrue;

import java.time.OffsetDateTime;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import org.junit.Test;

/**
 * 
 * Generate sample data --- Output should be copied to
 * src/main/resources/data.sql file
 *
 */
public class SampleDataTest {
	public final String FIELD_NAMES[] = { "Description", "Title", "Short_Description", "Header Description",
			"Header Title" };

	public final String OBJECT_TYPES[] = { "Indicator", "Observable", "Package", "TTP", "CoA" };

	public final String FIELD_VALUES[] = { "Confidence (08082016)", "PII presents",
			"Single Indicator: NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f", "Package with single indicator\n"
					+ " NCCIC:Indicator-f83b16c8-f32a-41d3-8d02-93ad0d37016f at\n" + " 2016-08-05T10:59:23Z" };
	public final String INSERT_STMT = "insert into human_review_item "
			+ "(id, stix_id, action, field_name, field_value, object_type, status) "
			+ "values(%d, '%s', %d, '%s', '%s', '%s',  '%s');";

	public final String INSERT_STMT_JSON_DATA = "insert into json_data(stix_id, original_json, modified_json) values('%s', '%s', '%s');";

	@Test
	public void shouldGenerateSampleData() {
		String dataSql = "data.sql";
		int count = 50;
		int id = 1;

		for (int i = 0; i < count; i++) {
			int numberFields = getNumberFields();
			String stixId = getStixId();
			int actionEnum = getActionEnum();
			List<String> fieldNames = new LinkedList<String>(Arrays.asList(FIELD_NAMES));
			List<String> fieldValues = new LinkedList<String>(Arrays.asList(FIELD_VALUES));
			String objectType = getObjectType();
			String status = "New";

			for (int j = 0; j < numberFields; j++) {
				String fieldName = getFieldName(fieldNames);
				String fieldValue = getFieldValue(fieldValues);

				String insert = String.format(INSERT_STMT, id++, stixId, actionEnum, fieldName, fieldValue, objectType,
						status);
				System.out.println(insert);
			}

			String insertJsonData = String.format(INSERT_STMT_JSON_DATA, stixId, getJsonData(stixId),
					getJsonData(stixId));
			System.out.println(insertJsonData);
		}
		assertTrue(true);
	}

	private static final String STIX_SAMPLE = "{\n" + 
			"  \"type\": \"bundle\",\n" + 
			"  \"id\": \"bundle--%s\",\n" + 
			"  \"spec_version\": \"2.0\",\n" + 
			"  \"objects\": [\n" + 
			"    {\n" + 
			"      \"type\": \"threat-actor\",\n" + 
			"      \"id\": \"threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428\",\n" + 
			"      \"created\": \"2014-11-19T23:39:03.893Z\",\n" + 
			"      \"modified\": \"2014-11-19T23:39:03.893Z\",\n" + 
			"      \"name\": \"Disco Team Threat Actor Group\",\n" + 
			"      \"description\": \"This organized threat actor group operates to create profit from all types of crime.\",\n" + 
			"      \"labels\": [\n" + 
			"        \"crime-syndicate\"\n" + 
			"      ],\n" + 
			"      \"aliases\": [\n" + 
			"        \"Equipo del Discoteca\"\n" + 
			"      ],\n" + 
			"      \"roles\": [\n" + 
			"        \"agent\"\n" + 
			"      ],\n" + 
			"      \"goals\": [\n" + 
			"        \"Steal Credit Card information\"\n" + 
			"      ],\n" + 
			"      \"sophistication\": \"expert\",\n" + 
			"      \"resource_level\": \"organization\",\n" + 
			"      \"primary_motivation\": \"personal-gain\"\n" + 
			"    },\n" + 
			"    {\n" + 
			"      \"type\": \"identity\",\n" + 
			"      \"id\": \"identity--733c5838-34d9-4fbf-949c-62aba761184c\",\n" + 
			"      \"created\": \"2016-08-23T18:05:49.307Z\",\n" + 
			"      \"modified\": \"2016-08-23T18:05:49.307Z\",\n" + 
			"      \"name\": \"Disco Team\",\n" + 
			"      \"description\": \"Disco Team is the name of an organized threat actor crime-syndicate.\",\n" + 
			"      \"identity_class\": \"organization\",\n" + 
			"      \"contact_information\": \"disco-team@stealthemail.com\"\n" + 
			"    },\n" + 
			"    {\n" + 
			"      \"type\": \"relationship\",\n" + 
			"      \"id\": \"relationship--966c5838-34d9-4fbf-949c-62aba7611837\",\n" + 
			"      \"created\": \"2016-08-23T18:05:49.307Z\",\n" + 
			"      \"modified\": \"2016-08-23T18:05:49.307Z\",\n" + 
			"      \"relationship_type\": \"attributed-to\",\n" + 
			"      \"source_ref\": \"threat-actor--dfaa8d77-07e2-4e28-b2c8-92e9f7b04428\",\n" + 
			"      \"target_ref\": \"identity--733c5838-34d9-4fbf-949c-62aba761184c\"\n" + 
			"    }\n" + 
			"  ]\n" + 
			"}";
	
	private Object getJsonData(String stixId) {
		return String.format(STIX_SAMPLE, stixId);
	}

	private String getObjectType() {
		return OBJECT_TYPES[(int) (OBJECT_TYPES.length * Math.random())];
	}

	private String getFieldValue(List<String> fieldValues) {
		return fieldValues.remove((int) (fieldValues.size() * Math.random()));
	}

	private String getFieldName(List<String> fieldNames) {
		return fieldNames.remove((int) (fieldNames.size() * Math.random()));
	}

	private String getDateTime() {
		return OffsetDateTime.now().toString();
	}

	private int getActionEnum() {
		return 0;
	}

	private String getStixId() {
		return UUID.randomUUID().toString();
	}

	private int getNumberFields() {
		return ((int) (FIELD_NAMES.length * Math.random()));
	}
}
