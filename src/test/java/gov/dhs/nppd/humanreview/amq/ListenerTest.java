package gov.dhs.nppd.humanreview.amq;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import javax.jms.JMSException;

import org.junit.Test;

public class ListenerTest {
	
	@Test
	public void shouldRecieveMessage() throws JMSException {
		// intentionally left the list hrItemListe empty!
		Listener listener = new Listener();
		String jsonMessage = "This is a test";
		String msg = listener.receiveMessage(jsonMessage);

		assertThat(msg, equalTo(jsonMessage));
	}

}
