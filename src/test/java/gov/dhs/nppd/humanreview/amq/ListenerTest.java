package gov.dhs.nppd.humanreview.amq;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import java.io.IOException;

import javax.jms.JMSException;

import org.junit.Test;
import org.mockito.Mockito;
import org.mockito.exceptions.base.MockitoException;

import gov.dhs.nppd.humanreview.util.JsonDocProcessor;

public class ListenerTest {

	@Test
	public void shouldRecieveMessage() throws JMSException, IOException, MockitoException {
		// intentionally left the list hrItemListe empty!
		Listener listener = new Listener();
		JsonDocProcessor mockJsonDocProc = Mockito.mock(JsonDocProcessor.class);
		Mockito.doThrow(new MockitoException(null, null)).when(mockJsonDocProc).loadJsonDoc("Random");

		listener.setJsonDocProc(mockJsonDocProc);

		String jsonMessage = "This is a test";

		listener.receiveMessage(jsonMessage);

		assertThat(jsonMessage, equalTo(jsonMessage));
	}

}
