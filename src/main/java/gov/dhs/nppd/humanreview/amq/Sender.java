package gov.dhs.nppd.humanreview.amq;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

@Component
public class Sender {		
	
	private static final Logger LOGGER = LogManager.getLogger(Sender.class);
	
	@Autowired
	JmsTemplate jmsTemplate;
	
	//@SendTo("outbound.stix")
	public String sendMessage(String jsonMessage) {
		LOGGER.info("--------Sent message: " + jsonMessage);		
		jmsTemplate.convertAndSend("outbound.stix", jsonMessage);
		return jsonMessage;
		
	}
}