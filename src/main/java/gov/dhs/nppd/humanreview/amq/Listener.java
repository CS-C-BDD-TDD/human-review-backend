package gov.dhs.nppd.humanreview.amq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.TextMessage;

import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

@EnableJms
@Component
public class Listener {

	@JmsListener(destination = "inbound.stix")
	@SendTo("outbound.stix")
	public String receiveMessage(@Payload String jsonMessage) throws JMSException {
		
		System.out.println("********Received message " + jsonMessage);
		return jsonMessage;
	}
}
