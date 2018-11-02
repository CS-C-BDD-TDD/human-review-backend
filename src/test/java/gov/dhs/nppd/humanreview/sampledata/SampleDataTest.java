package gov.dhs.nppd.humanreview.sampledata;

import static org.junit.Assert.assertTrue;

import java.time.OffsetDateTime;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import org.junit.Test;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.jayway.jsonpath.JsonPath;

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
	public final String INSERT_STMT = "insert into Human_Review_Item (id, stix_id, action, original_date, modified_date, field_name, "
			+ "field_value, object_type, status) "
			// id, stixid, actionenum, date-time, date-time, fieldname, fieldvalue,
			// objecttype, status, originaljson, modifiedjson
			+ "values(%d, '%s', %d, '%s', '%s', '%s', '%s', '%s',  '%s');";

	public final String INSERT_STMT_JSON_DATA = "insert into Json_Data(stix_id, original_json, modified_json) values('%s', '%s', '%s');";

	@Test
	public void shouldGenerateSampleData() {
		String dataSql = "data.sql";
		int count = 50;
		int id = 1;

		for (int i = 0; i < count; i++) {
			int numberFields = getNumberFields();
			String stixId = getStixId();
			int actionEnum = getActionEnum();
			String oldTime = getDateTime();
			String newTime = getDateTime();
			List<String> fieldNames = new LinkedList<String>(Arrays.asList(FIELD_NAMES));
			List<String> fieldValues = new LinkedList<String>(Arrays.asList(FIELD_VALUES));
			String objectType = getObjectType();
			String status = "New";

			for (int j = 0; j < numberFields; j++) {
				String fieldName = getFieldName(fieldNames);
				String fieldValue = getFieldValue(fieldValues);

				String insert = String.format(INSERT_STMT, id++, stixId, actionEnum, oldTime, newTime, fieldName,
						fieldValue, objectType, status);
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

	@Test
	public void loadJsonAndTest() {
		JsonParser parser = new JsonParser();

		JsonObject jsonTree = parser.parse(ACTUAL_JSON_DATA).getAsJsonObject();
		Hashtable<String, String> elements = new Hashtable<String, String>();

		getElements(jsonTree, elements, "");

//		JsonArray coaArray = jsonTree.get("ind_course_of_actions").getAsJsonArray();
//
//		for (int i = 0; i < coaArray.size(); i++) {
//			coaArray.get(i).getAsJsonObject().entrySet().stream().forEach((entry) -> {
//				System.out.println(entry.getKey() + ":" + entry.getValue());
//			});
//		}


	}

	private void getElements(JsonObject jsonTree, Hashtable<String, String> elements, String elName) {

		jsonTree.entrySet().stream().forEach((entry) -> {
			String curElName;
			if (elName.isEmpty()) {
				curElName = entry.getKey();
			} else {
				curElName = elName + "." + entry.getKey();
			}

			System.out.println(curElName + ":" + entry.getValue());
			if (jsonTree.get(entry.getKey()) != null) {
//				System.out.println("---> " + jsonTree.get(entry.getKey()).getClass());
				try {
					if (jsonTree.get(entry.getKey()).getAsJsonArray() instanceof JsonArray) {
						JsonArray array = jsonTree.get(entry.getKey()).getAsJsonArray();
						for (int i = 0; i < array.size(); i++) {
							getElements(array.get(i).getAsJsonObject(), elements, curElName + "[" + i + "]");
						}
					}
				} catch (Exception e) {
				}
				try {
					if (jsonTree.get(entry.getKey()).getAsJsonObject() instanceof JsonObject) {
						getElements(jsonTree.get(entry.getKey()).getAsJsonObject(), elements, curElName);
					}
				} catch (Exception e) {
				}
			}
		});
	}

	private static final String ACTUAL_JSON_DATA = "{\n" + "    \"category\": \"ipv4-addr\",\n"
			+ "    \"cybox_object_id\": \"NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0\",\n"
			+ "    \"ip_value_calculated_start\": 87175888,\n" + "    \"ip_value_calculated_end\": 87175888,\n"
			+ "    \"created_at\": \"2018-08-30T18:24:27.000Z\",\n"
			+ "    \"updated_at\": \"2018-08-30T18:25:47.000Z\",\n"
			+ "    \"guid\": \"f7daa741-662e-4746-83b8-1d6f0e5c8f33\",\n" + "    \"iso_country_code\": null,\n"
			+ "    \"com_threat_score\": null,\n" + "    \"gov_threat_score\": null,\n"
			+ "    \"agencies_sensors_seen_on\": null,\n" + "    \"first_date_seen\": null,\n"
			+ "    \"last_date_seen\": null,\n" + "    \"combined_score\": null,\n" + "    \"category_list\": null,\n"
			+ "    \"portion_marking\": \"U\",\n" + "    \"read_only\": false,\n"
			+ "    \"address_condition\": \"Equals\",\n" + "    \"is_ciscp\": false,\n" + "    \"is_mifr\": false,\n"
			+ "    \"feeds\": null,\n" + "    \"address\": \"5.50.50.208/32\",\n"
			+ "    \"address_input\": \"5.50.50.208\",\n" + "    \"total_sightings\": 0,\n"
			+ "    \"course_of_actions\": [],\n" + "    \"ind_course_of_actions\": [\n" + "        {\n"
			+ "            \"title\": \"!!!###HUMAN REVIEW###!!!This is the title of the CISA defensive measure. \",\n"
			+ "            \"title_c\": null,\n"
			+ "            \"description\": \"!!!###HUMAN REVIEW###!!!This is the description of a CISA defensive measure\",\n"
			+ "            \"description_c\": null,\n"
			+ "            \"stix_id\": \"NCCIC:Course_Of_Action-5b8f0d65-c2c1-43c6-bb0d-4717c5ed5f59\",\n"
			+ "            \"portion_marking\": \"U\",\n"
			+ "            \"created_at\": \"2018-08-30T18:24:19.000Z\",\n"
			+ "            \"updated_at\": \"2018-08-30T18:25:29.000Z\",\n"
			+ "            \"guid\": \"0a12e346-90ca-4835-8487-b6b0c334e262\",\n"
			+ "            \"old_acs_set_id\": null,\n" + "            \"read_only\": false,\n"
			+ "            \"description_normalized\": \"This is the description of a CISA defensive measure\",\n"
			+ "            \"is_ciscp\": false,\n" + "            \"is_mifr\": false,\n"
			+ "            \"feeds\": null,\n" + "            \"acs_set_id\": null\n" + "        }\n" + "    ],\n"
			+ "    \"dns_records\": [],\n" + "    \"socket_addresses\": [],\n" + "    \"stix_markings\": [\n"
			+ "        {\n" + "            \"id\": 390752,\n"
			+ "            \"guid\": \"4094db59-0e31-401e-96b3-bdc9d7450707\",\n"
			+ "            \"remote_object_id\": \"f7daa741-662e-4746-83b8-1d6f0e5c8f33\",\n"
			+ "            \"remote_object_type\": \"Address\",\n"
			+ "            \"stix_id\": \"NCCIC:DataMarking-4094db59-0e31-401e-96b3-bdc9d7450707\",\n"
			+ "            \"created_at\": \"2018-08-30T18:25:45.000Z\",\n"
			+ "            \"updated_at\": \"2018-08-30T18:25:45.000Z\",\n"
			+ "            \"remote_object_field\": null,\n"
			+ "            \"controlled_structure\": \"//cybox:Object[@id='NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0']/descendant-or-self::node()| //cybox:Object[@id='NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0']/descendant-or-self::node()/@*\",\n"
			+ "            \"isa_marking_structure\": {\n" + "                \"id\": 390067,\n"
			+ "                \"data_item_created_at\": \"2018-08-30T18:24:27.000Z\",\n"
			+ "                \"guid\": \"ffa7ae34-0e2a-4d04-9baf-a0623da39924\",\n"
			+ "                \"re_custodian\": \"USA.DHS.US-CERT\",\n" + "                \"re_originator\": null,\n"
			+ "                \"stix_id\": \"NCCIC:IsaMarkingStructure-ffa7ae34-0e2a-4d04-9baf-a0623da39924\",\n"
			+ "                \"updated_at\": \"2018-08-30T18:25:46.391Z\",\n"
			+ "                \"transfer_from_low\": false\n" + "            },\n"
			+ "            \"isa_assertion_structure\": {\n" + "                \"id\": 389358,\n"
			+ "                \"cs_classification\": \"U\",\n" + "                \"cs_countries\": null,\n"
			+ "                \"cs_cui\": null,\n" + "                \"cs_entity\": null,\n"
			+ "                \"cs_formal_determination\": null,\n" + "                \"cs_orgs\": \"USA.USG\",\n"
			+ "                \"cs_shargrp\": null,\n"
			+ "                \"guid\": \"788c5b8f-5f36-41a3-a569-c505871612ad\",\n"
			+ "                \"is_default_marking\": false,\n" + "                \"privilege_default\": \"deny\",\n"
			+ "                \"public_release\": false,\n" + "                \"public_released_by\": null,\n"
			+ "                \"public_released_on\": null,\n"
			+ "                \"stix_id\": \"NCCIC:IsaAssertionStructure-788c5b8f-5f36-41a3-a569-c505871612ad\",\n"
			+ "                \"cs_info_caveat\": null,\n" + "                \"classified_by\": null,\n"
			+ "                \"classified_on\": null,\n" + "                \"classification_reason\": null,\n"
			+ "                \"updated_at\": \"2018-08-30T18:25:46.617Z\",\n"
			+ "                \"transfer_from_low\": false,\n" + "                \"isa_privs\": [\n"
			+ "                    {\n" + "                        \"id\": 3909614,\n"
			+ "                        \"action\": \"DSPLY\",\n" + "                        \"effect\": \"permit\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909615,\n"
			+ "                        \"action\": \"IDSRC\",\n" + "                        \"effect\": \"deny\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909616,\n"
			+ "                        \"action\": \"TENOT\",\n" + "                        \"effect\": \"deny\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909617,\n"
			+ "                        \"action\": \"NETDEF\",\n" + "                        \"effect\": \"permit\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909618,\n"
			+ "                        \"action\": \"LEGAL\",\n" + "                        \"effect\": \"deny\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909619,\n"
			+ "                        \"action\": \"INTEL\",\n" + "                        \"effect\": \"permit\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909620,\n"
			+ "                        \"action\": \"TEARLINE\",\n" + "                        \"effect\": \"permit\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909621,\n"
			+ "                        \"action\": \"OPACTION\",\n" + "                        \"effect\": \"permit\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909622,\n"
			+ "                        \"action\": \"REQUEST\",\n" + "                        \"effect\": \"permit\"\n"
			+ "                    },\n" + "                    {\n" + "                        \"id\": 3909623,\n"
			+ "                        \"action\": \"ANONYMOUSACCESS\",\n"
			+ "                        \"effect\": \"deny\"\n" + "                    }\n" + "                ],\n"
			+ "                \"further_sharings\": []\n" + "            }\n" + "        }\n" + "    ],\n"
			+ "    \"audits\": [\n" + "        {\n"
			+ "            \"message\": \"STIX Marking Structure added to NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0\",\n"
			+ "            \"details\": \"{\\\"remote_object_field\\\" => \\\"\\\"}{\\\"remote_object_id\\\"=>\\\"f7daa741-662e-4746-83b8-1d6f0e5c8f33\\\", \\\"remote_object_type\\\"=>\\\"Address\\\", \\\"controlled_structure\\\"=>\\\"//cybox:Object[@id='NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0']/descendant-or-self::node()| //cybox:Object[@id='NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0']/descendant-or-self::node()/@*\\\", \\\"guid\\\"=>\\\"4094db59-0e31-401e-96b3-bdc9d7450707\\\", \\\"stix_id\\\"=>\\\"NCCIC:DataMarking-4094db59-0e31-401e-96b3-bdc9d7450707\\\"}\",\n"
			+ "            \"audit_type\": \"marking_create\",\n"
			+ "            \"event_time\": \"2018-08-30T18:25:45.000Z\",\n" + "            \"user_guid\": null,\n"
			+ "            \"system_guid\": \"CIAP:ciap6-gte.sec.dte.cert.org\",\n"
			+ "            \"justification\": null\n" + "        },\n" + "        {\n"
			+ "            \"message\": \"Address '5.50.50.208' attached to Indicator 'NCCIC:Indicator-58fed80b-0b4d-40c6-9deb-6c2a9376af06'\",\n"
			+ "            \"details\": null,\n" + "            \"audit_type\": \"link\",\n"
			+ "            \"event_time\": \"2018-08-30T18:24:33.000Z\",\n"
			+ "            \"user_guid\": \"651e3b9d-1c87-49da-8f2c-df2b0fe6503a\",\n"
			+ "            \"system_guid\": \"CIAP:ciap6-gte.sec.dte.cert.org\",\n"
			+ "            \"justification\": null,\n" + "            \"user\": {\n"
			+ "                \"id\": 10124,\n" + "                \"username\": \"flarerelay\",\n"
			+ "                \"guid\": \"651e3b9d-1c87-49da-8f2c-df2b0fe6503a\"\n" + "            }\n"
			+ "        },\n" + "        {\n" + "            \"message\": \"Address created\",\n"
			+ "            \"details\": \"{\\\"category\\\"=>\\\"ipv4-addr\\\", \\\"address_value_normalized\\\"=>\\\"5.50.50.208/32\\\", \\\"cybox_hash\\\"=>\\\"33d9db1820346d6480f1bc749db248e4d6fa994760927d48ea36c58876f14bc9\\\", \\\"ip_value_calculated_start\\\"=>87175888, \\\"ip_value_calculated_end\\\"=>87175888, \\\"address_value_raw\\\"=>\\\"5.50.50.208\\\", \\\"cybox_object_id\\\"=>\\\"NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0\\\", \\\"is_spoofed\\\"=>false, \\\"is_source\\\"=>false, \\\"is_destination\\\"=>true, \\\"guid\\\"=>\\\"f7daa741-662e-4746-83b8-1d6f0e5c8f33\\\", \\\"id\\\"=>44046}\",\n"
			+ "            \"audit_type\": \"create\",\n"
			+ "            \"event_time\": \"2018-08-30T18:24:27.000Z\",\n"
			+ "            \"user_guid\": \"651e3b9d-1c87-49da-8f2c-df2b0fe6503a\",\n"
			+ "            \"system_guid\": \"CIAP:ciap6-gte.sec.dte.cert.org\",\n"
			+ "            \"justification\": null,\n" + "            \"user\": {\n"
			+ "                \"id\": 10124,\n" + "                \"username\": \"flarerelay\",\n"
			+ "                \"guid\": \"651e3b9d-1c87-49da-8f2c-df2b0fe6503a\"\n" + "            }\n" + "        }\n"
			+ "    ],\n" + "    \"badge_statuses\": [],\n" + "    \"stix_packages\": [\n" + "        {\n"
			+ "            \"created_at\": \"2018-08-30T18:24:13.000Z\",\n"
			+ "            \"description\": \"!!!###HUMAN REVIEW###!!!Description with PII\",\n"
			+ "            \"info_src_produced_time\": \"2018-08-30T18:24:06.000Z\",\n"
			+ "            \"is_reference\": false,\n" + "            \"package_intent\": \"Threat Report\",\n"
			+ "            \"short_description\": null,\n"
			+ "            \"stix_id\": \"NCCIC:STIX_Package-a37d99af-47d9-4175-894f-a49a9b34d3a6\",\n"
			+ "            \"stix_timestamp\": \"9999-12-31T00:00:00.000Z\",\n"
			+ "            \"title\": \"NCCIC:STIX_Package-a37d99af-47d9-4175-894f-a49a9b34d3a6.  This is testing FLARE 2.2 FLOW for DTES-6929\",\n"
			+ "            \"updated_at\": \"2018-08-30T18:25:31.000Z\",\n"
			+ "            \"username\": \"flarerelay\",\n"
			+ "            \"guid\": \"9e1d9b4a-efdb-4d52-9781-813fbe6f46e6\",\n"
			+ "            \"submission_mechanism\": [\n" + "                \"AIS\"\n" + "            ],\n"
			+ "            \"portion_marking\": \"U\",\n" + "            \"read_only\": false,\n"
			+ "            \"title_c\": null,\n" + "            \"description_c\": null,\n"
			+ "            \"short_description_c\": null,\n" + "            \"package_intent_c\": null,\n"
			+ "            \"is_ciscp\": false,\n" + "            \"short_description_normalized\": null,\n"
			+ "            \"is_mifr\": false,\n" + "            \"feeds\": null,\n"
			+ "            \"src_feed\": null,\n"
			+ "            \"uploaded_file_id\": \"51288c31-4df6-4078-99d5-42d490b31aa8\",\n"
			+ "            \"acs_set_id\": null,\n" + "            \"color\": null,\n"
			+ "            \"badge_statuses\": [\n" + "                {\n"
			+ "                    \"badge_name\": \"UPLOADED\",\n" + "                    \"badge_status\": null,\n"
			+ "                    \"remote_object_id\": \"9e1d9b4a-efdb-4d52-9781-813fbe6f46e6\",\n"
			+ "                    \"remote_object_type\": \"StixPackage\",\n"
			+ "                    \"guid\": \"49944e19-7608-435a-b263-19d46590e71d\",\n"
			+ "                    \"system\": true,\n"
			+ "                    \"created_at\": \"2018-08-30T18:24:19.000Z\",\n"
			+ "                    \"updated_at\": \"2018-08-30T18:24:19.000Z\"\n" + "                }\n"
			+ "            ]\n" + "        }\n" + "    ],\n" + "    \"indicators\": [\n" + "        {\n"
			+ "            \"id\": 168212,\n" + "            \"composite_operator\": null,\n"
			+ "            \"created_at\": \"2018-08-30T18:24:23.000Z\",\n" + "            \"description\": null,\n"
			+ "            \"indicator_type\": \"ip_watchlist\",\n"
			+ "            \"indicator_type_vocab_name\": null,\n" + "            \"indicator_type_vocab_ref\": null,\n"
			+ "            \"is_composite\": false,\n" + "            \"is_negated\": false,\n"
			+ "            \"is_reference\": false,\n" + "            \"resp_entity_stix_ident_id\": null,\n"
			+ "            \"stix_id\": \"NCCIC:Indicator-58fed80b-0b4d-40c6-9deb-6c2a9376af06\",\n"
			+ "            \"dms_label\": null,\n" + "            \"stix_timestamp\": \"9999-12-31T00:00:00.000Z\",\n"
			+ "            \"title\": \"NCCIC:Indicator-58fed80b-0b4d-40c6-9deb-6c2a9376af06\",\n"
			+ "            \"updated_at\": \"2018-08-30T18:25:45.000Z\",\n"
			+ "            \"downgrade_request_id\": null,\n"
			+ "            \"guid\": \"b56274f6-8169-4790-bb39-3ebcd0494ae0\",\n" + "            \"reference\": null,\n"
			+ "            \"alternative_id\": null,\n" + "            \"from_weather_map\": false,\n"
			+ "            \"portion_marking\": \"U\",\n" + "            \"read_only\": false,\n"
			+ "            \"title_c\": null,\n" + "            \"description_c\": null,\n"
			+ "            \"indicator_type_c\": null,\n" + "            \"dms_label_c\": null,\n"
			+ "            \"downgrade_request_id_c\": null,\n" + "            \"reference_c\": null,\n"
			+ "            \"alternative_id_c\": null,\n" + "            \"timelines\": null,\n"
			+ "            \"source_of_report\": null,\n" + "            \"target_of_attack\": null,\n"
			+ "            \"target_scope\": null,\n" + "            \"actor_attribution\": null,\n"
			+ "            \"actor_type\": null,\n" + "            \"modus_operandi\": null,\n"
			+ "            \"is_ais\": true,\n" + "            \"observable_type\": \"Address\",\n"
			+ "            \"observable_value\": \"5.50.50.208/32\",\n" + "            \"threat_actor_id\": null,\n"
			+ "            \"threat_actor_title\": null,\n"
			+ "            \"start_time\": \"9999-12-31T00:00:00.000Z\",\n"
			+ "            \"end_time\": \"9999-12-31T00:00:00.000Z\",\n" + "            \"is_ciscp\": false,\n"
			+ "            \"is_mifr\": false,\n" + "            \"feeds\": null,\n"
			+ "            \"parent_id\": null,\n" + "            \"acs_set_id\": null,\n"
			+ "            \"color\": null,\n" + "            \"confidences\": null,\n"
			+ "            \"acs_set\": null\n" + "        }\n" + "    ],\n" + "    \"email_messages\": []\n" + "}";

}
