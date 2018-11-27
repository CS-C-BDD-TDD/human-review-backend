package gov.dhs.nppd.humanreview.amq;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Component;

@Component
public class Sender {		
	
	private static final Logger LOGGER = LogManager.getLogger(Sender.class);
	public static final String OUTBOUND_TOPICS = "outbound.topic";
	
	@Autowired
	JmsTemplate jmsTemplate;
	
	public String sendMessage(String jsonMessage) {
		LOGGER.info("--------Sent message: " + jsonMessage);		
		jmsTemplate.convertAndSend(OUTBOUND_TOPICS, jsonMessage);
		return jsonMessage;
		
	}
}