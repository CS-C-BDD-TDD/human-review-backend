package gov.dhs.nppd.humanreview.amq;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

@EnableJms
@Component
public class Listener {
	private static final Logger LOGGER = LogManager.getLogger(Listener.class);
	@JmsListener(destination = "inbound.stix")
	@SendTo("outbound.stix")
	public String receiveMessage(@Payload String jsonMessage) {
		LOGGER.info("********Received message " + jsonMessage);
		return jsonMessage;
	}
}
