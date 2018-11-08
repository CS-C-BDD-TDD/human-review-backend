package gov.dhs.nppd.humanreview.util;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import java.io.IOException;

import javax.jms.JMSException;

import org.junit.Test;
import org.mockito.Mockito;

import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class JsonDocProcessorTest {
	
	@Test
	public void shouldRecieveMessage() throws JMSException, IOException {
		JsonDocProcessor jsonDocProcessor = new JsonDocProcessor();
		
//		JsonParser mockJsonParser = Mockito.mock(JsonParser.class);
//
//		
//		JsonObject o = mockJsonParser.parse("{\"a\": \"A\"}").getAsJsonObject();
//		Mockito.when(o).thenReturn(o);
//
//		jsonDocProcessor.setParser(mockJsonParser);

		String jsonMessage = " {\r\n" + 
				"        \"car1\":\"Ford\",\r\n" + 
				"        \"car2\":\"BMW\",\r\n" + 
				"        \"car3\":\"Fiat\"\r\n" + 
				"    }";
		
		jsonDocProcessor.loadJsonDoc(jsonMessage);

		assertThat(jsonMessage, equalTo(jsonMessage));
	}

}
