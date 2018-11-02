

package org.openapitools;

import javax.jms.JMSException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.ExitCodeGenerator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jms.JmsAutoConfiguration;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.event.EventListener;
import org.springframework.jms.annotation.EnableJms;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


@SpringBootApplication
@ComponentScan(basePackages = { "org.openapitools", "org.openapitools.api", "org.openapitools.configuration",
		"gov.dhs.nppd.humanreview" })
@Configuration
@EnableAspectJAutoProxy
@EnableJms
public class OpenAPI2SpringBoot implements CommandLineRunner {
	
	@Override
	public void run(String... arg0) throws Exception {
		
		if (arg0.length > 0 && arg0[0].equals("exitcode")) {
			throw new ExitException();
		}
	}

	public static void main(String[] args) throws Exception {
		ConfigurableApplicationContext context =  SpringApplication.run(OpenAPI2SpringBoot.class, args);
		JmsTemplate jmsTemplate = context.getBean(JmsTemplate.class);
		for (int i = 0; i < 5; i++){
			jmsTemplate.convertAndSend("inbound.stix","----- Sending message " + i + " of 4 to JMS Queue");
	   }
	}

	class ExitException extends RuntimeException implements ExitCodeGenerator {
		private static final long serialVersionUID = 1L;

		@Override
		public int getExitCode() {
			return 10;
		}

	}

	@Bean
	public WebMvcConfigurer webConfigurer() {
		return new WebMvcConfigurer() {

			@Override
			public void addCorsMappings(CorsRegistry registry) {
				registry.addMapping("/**").allowedOrigins("*").allowedMethods("*").allowedHeaders("*");
			}

		};
	}

	/*@EventListener(ApplicationReadyEvent.class)
	public void doSomethingAfterStartup() throws JMSException {
			
		 JmsTemplate jmsTemplate = context.getBean(JmsTemplate.class);
	        jmsTemplate.convertAndSend("inboundQueue", "Hello World");	
		 	for (int i = 0; i < 5; i++){
		 		sender.sendMessage("Sending message " + i + " of 4 to JMS Queue");
		   }
	} */
}

