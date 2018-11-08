package gov.dhs.nppd.humanreview.util;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import java.io.IOException;

import javax.jms.JMSException;

import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.repository.HumanreviewRepository;
import org.openapitools.repository.JsonDataRepository;

public class JsonDocProcessorTest {
	
	@Test
	public void shouldRecieveMessage() throws JMSException, IOException {
		JsonDocProcessor jsonDocProcessor = new JsonDocProcessor();
		
		HumanreviewRepository mockHrRepo = Mockito.mock(HumanreviewRepository.class);
		JsonDataRepository mockJsonRepo = Mockito.mock(JsonDataRepository.class);
		jsonDocProcessor.setHrRepo(mockHrRepo);
		jsonDocProcessor.setJsonDataRepo(mockJsonRepo);

		String jsonMessage = " {\r\n" + 
				"	\"category\": \"ipv4-addr\",\r\n" + 
				"	\"cybox_object_id\": \"NCCIC:Object-b4971868-4860-4deb-8705-ca9d8922d6b0\",\r\n" + 
				"	\"ip_value_calculated_start\": 87175888,\r\n" + 
				"	\"ip_value_calculated_end\": 87175888,\r\n" + 
				"	\"created_at\": \"2018-08-30T18:24:27.000Z\",\r\n" + 
				"	\"updated_at\": \"2018-08-30T18:25:47.000Z\",\r\n" + 
				"	\"guid\": \"f7daa741-662e-4746-83b8-1d6f0e5c8f33\",\r\n" + 
				"	\"iso_country_code\": null,\r\n" + 
				"	\"com_threat_score\": null,\r\n" + 
				"	\"gov_threat_score\": null,\r\n" + 
				"	\"agencies_sensors_seen_on\": null,\r\n" + 
				"	\"first_date_seen\": null,\r\n" + 
				"	\"last_date_seen\": null,\r\n" + 
				"	\"combined_score\": null,\r\n" + 
				"	\"category_list\": null,\r\n" + 
				"	\"portion_marking\": \"U\",\r\n" + 
				"	\"read_only\": false,\r\n" + 
				"	\"address_condition\": \"Equals\",\r\n" + 
				"	\"is_ciscp\": false,\r\n" + 
				"	\"is_mifr\": false,\r\n" + 
				"	\"feeds\": null,\r\n" + 
				"	\"address\": \"5.50.50.208/32\",\r\n" + 
				"	\"address_input\": \"5.50.50.208\",\r\n" + 
				"	\"total_sightings\": 0,\r\n" + 
				"	\"course_of_actions\": [],\r\n" + 
				"	\"ind_course_of_actions\": [{\r\n" + 
				"		\"title\": \"!!!###HUMAN REVIEW###!!!This is the title of the CISA defensive measure. \",\r\n" + 
				"		\"title_c\": null,\r\n" + 
				"		\"description\": \"!!!###HUMAN REVIEW###!!!This is the description of a CISA defensive measure\",\r\n" + 
				"		\"description_c\": null,\r\n" + 
				"		\"stix_id\": \"NCCIC:Course_Of_Action-5b8f0d65-c2c1-43c6-bb0d-4717c5ed5f59\",\r\n" + 
				"		\"portion_marking\": \"U\",\r\n" + 
				"		\"created_at\": \"2018-08-30T18:24:19.000Z\",\r\n" + 
				"		\"updated_at\": \"2018-08-30T18:25:29.000Z\",\r\n" + 
				"		\"guid\": \"0a12e346-90ca-4835-8487-b6b0c334e262\",\r\n" + 
				"		\"old_acs_set_id\": null,\r\n" + 
				"		\"read_only\": false,\r\n" + 
				"		\"description_normalized\": \"This is the description of a CISA defensive measure\",\r\n" + 
				"		\"is_ciscp\": false,\r\n" + 
				"		\"is_mifr\": false,\r\n" + 
				"		\"feeds\": null,\r\n" + 
				"		\"acs_set_id\": null\r\n" + 
				"	}],\r\n" + 
				"	\"badge_statuses\": [],\r\n" + 
				"	\"stix_packages\": [{\r\n" + 
				"		\"created_at\": \"2018-08-30T18:24:13.000Z\",\r\n" + 
				"		\"description\": \"!!!###HUMAN REVIEW###!!!Description with PII\",\r\n" + 
				"		\"info_src_produced_time\": \"2018-08-30T18:24:06.000Z\",\r\n" + 
				"		\"is_reference\": false,\r\n" + 
				"		\"package_intent\": \"Threat Report\",\r\n" + 
				"		\"short_description\": null,\r\n" + 
				"		\"stix_id\": \"NCCIC:STIX_Package-a37d99af-47d9-4175-894f-a49a9b34d3a6\",\r\n" + 
				"		\"stix_timestamp\": \"9999-12-31T00:00:00.000Z\",\r\n" + 
				"		\"title\": \"NCCIC:STIX_Package-a37d99af-47d9-4175-894f-a49a9b34d3a6.  This is testing FLARE 2.2 FLOW for DTES-6929\",\r\n" + 
				"		\"updated_at\": \"2018-08-30T18:25:31.000Z\",\r\n" + 
				"		\"username\": \"flarerelay\",\r\n" + 
				"		\"guid\": \"9e1d9b4a-efdb-4d52-9781-813fbe6f46e6\",\r\n" + 
				"		\"submission_mechanism\": \"AIS\",\r\n" + 
				"		\"email_messages\": []\r\n" + 
				"	}]\r\n" + 
				"}";
		
		jsonDocProcessor.loadJsonDoc(jsonMessage);

		assertThat(jsonMessage, equalTo(jsonMessage));
	}

}
