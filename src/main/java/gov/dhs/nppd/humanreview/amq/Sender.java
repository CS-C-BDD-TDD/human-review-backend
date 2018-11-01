package gov.dhs.nppd.humanreview.amq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.TextMessage;

import org.springframework.messaging.handler.annotation.SendTo;

public class Sender {

	@SendTo("inbound.stix")
	public String sendMessage(final Message jsonMessage) throws JMSException {
		String messageData = null;
		System.out.println("Sent message " + jsonMessage);
		if(jsonMessage instanceof TextMessage) {
			TextMessage textMessage = (TextMessage)jsonMessage;
			messageData = textMessage.getText();
		}
		return messageData;
	}
	
}
