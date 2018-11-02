package gov.dhs.nppd.humanreview.amq;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

@Component
public class Sender {		
	private static final Logger LOGGER = LogManager.getLogger(Sender.class);
	
	@SendTo("inbound.stix")
	public String sendMessage(String jsonMessage) {
		LOGGER.info("--------Sent message: " + jsonMessage);		
		return jsonMessage;
	}

}
