package gov.dhs.nppd.humanreview.amq;

import java.io.IOException;

import javax.jms.ConnectionFactory;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.jms.DefaultJmsListenerContainerFactoryConfigurer;
import org.springframework.context.annotation.Bean;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.config.DefaultJmsListenerContainerFactory;
import org.springframework.jms.config.JmsListenerContainerFactory;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Component;

import gov.dhs.nppd.humanreview.util.JsonDocProcessor;

@Component
public class Listener {
	private static final Logger LOGGER = LogManager.getLogger(Listener.class);

	public static final String INBOUND_TOPIC = "inbound.topic";

	@Bean
	public JmsListenerContainerFactory<?> topicListenerFactory(ConnectionFactory connectionFactory,
			DefaultJmsListenerContainerFactoryConfigurer configurer) {
		DefaultJmsListenerContainerFactory factory = new DefaultJmsListenerContainerFactory();
		configurer.configure(factory, connectionFactory);
		factory.setPubSubDomain(true);
		return factory;
	}

	@Autowired
	JsonDocProcessor jsonDocProc;

	@JmsListener(destination = INBOUND_TOPIC, containerFactory = "topicListenerFactory")
	public void receiveMessage(@Payload String jsonMessage) throws IOException {
		LOGGER.info("********Received: " + jsonMessage);
		jsonDocProc.loadJsonDoc(jsonMessage);
	}

	public void setJsonDocProc(JsonDocProcessor jsonDocProc) {
		this.jsonDocProc = jsonDocProc;
	}

}
