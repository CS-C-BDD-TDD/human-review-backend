package gov.dhs.nppd.humanreview.amq;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.TextMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

@Component
public class Sender {	
	
	@SendTo("inbound.stix")
	public String sendMessage(String jsonMessage) throws JMSException {
		System.out.println("--------Sent message: " + jsonMessage);
		
		return jsonMessage;
	}

}
