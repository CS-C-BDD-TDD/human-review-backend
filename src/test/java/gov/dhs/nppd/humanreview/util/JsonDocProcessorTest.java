package gov.dhs.nppd.humanreview.util;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import java.io.IOException;

import javax.jms.JMSException;

import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.repository.humanreview.HumanreviewRepository;
import org.openapitools.repository.humanreview.JsonDataRepository;

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
				"	\"id\": \"f7daa741-662e-4746-83b8-1d6f0e5c8f33\",\r\n" + 
				"	\"course_of_actions\": [],\r\n" + 
				"	\"ind_course_of_actions\": [{\r\n" + 
				"		\"title\": \"!!!###HUMAN REVIEW###!!!This is the title of the CISA defensive measure. \",\r\n" + 
				"		\"description\": \"!!!###HUMAN REVIEW###!!!This is the description of a CISA defensive measure\",\r\n" + 
				"		\"acs_set_id\": null\r\n" + 
				"	}],\r\n" + 
				"	\"badge_statuses\": [],\r\n" + 
				"	\"stix_packages\": [{\r\n" + 
				"		\"created_at\": \"2018-08-30T18:24:13.000Z\",\r\n" + 
				"		\"description\": \"!!!###HUMAN REVIEW###!!!Description with PII\",\r\n" + 
				"		\"guid\": \"9e1d9b4a-efdb-4d52-9781-813fbe6f46e6\",\r\n" + 
				"		\"submission_mechanism\": \"AIS\",\r\n" + 
				"		\"email_messages\": []\r\n" + 
				"	}]\r\n" + 
				"}";
		
		jsonDocProcessor.loadJsonDoc(jsonMessage);

		assertThat(jsonMessage, equalTo(jsonMessage));
	}

}
