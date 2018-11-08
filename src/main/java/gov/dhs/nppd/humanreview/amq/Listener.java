package gov.dhs.nppd.humanreview.amq;

import java.io.IOException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import gov.dhs.nppd.humanreview.util.JsonDocProcessor;

@Component
public class Listener {
	private static final Logger LOGGER = LogManager.getLogger(Listener.class);
	@Autowired
	JsonDocProcessor jsonDocProc;
	
	@JmsListener(destination = "inbound.stix")
	public void receiveMessage(@Payload String jsonMessage) throws IOException {
		LOGGER.info("********Received: " + jsonMessage);
		jsonDocProc.loadJsonDoc(jsonMessage);
	}

	public void setJsonDocProc(JsonDocProcessor jsonDocProc) {
		this.jsonDocProc = jsonDocProc;
	}
	
}
