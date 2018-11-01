package gov.dhs.nppd.humanreview.amq;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import javax.jms.JMSException;

import org.junit.Test;

public class SenderTest {
	@Test
	public void shouldRecieveMessage() throws JMSException {
		// intentionally left the list hrItemListe empty!
		Sender sender = new Sender();
		String jsonMessage = "This is a test";
		String msg = sender.sendMessage(jsonMessage);

		assertThat(msg, equalTo(jsonMessage));
	}
}
