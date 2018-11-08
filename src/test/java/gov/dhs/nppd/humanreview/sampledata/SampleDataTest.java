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

			String insertJsonData = String.format(INSERT_STMT_JSON_DATA, stixId, getJsonData(stixId), "");
			System.out.println(insertJsonData);
		}
		assertTrue(true);
	}

	private Object getJsonData(String stixId) {
		return String
				.format("{\n" + "        \"stix_id\": \"%s\",\n" + "        \"field_name\": \"Short_Description\",\n"
						+ "        \"field_value\": \"PII presents\",\n" + "        \"object_type\": \"Package\",\n"
						+ "        \"status\": \"New\",\n" + "        \"action\": \"\"\n" + "    }", stixId);
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
