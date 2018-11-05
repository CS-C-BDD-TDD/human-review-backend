package gov.dhs.nppd.humanreview.amq;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import javax.annotation.Resource;
import javax.jms.JMSException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration
public class SenderTest {
	
	@MockBean
	private JmsTemplate mockJmsTemplate;
	
	@InjectMocks
	private Sender sender;
	
	@Test
	public void shouldRecieveMessage() throws JMSException {
		// intentionally left the list hrItemListe empty!
		MockitoAnnotations.initMocks(this);
		String jsonMessage = "This is a test";
		mockJmsTemplate = Mockito.mock(JmsTemplate.class);
		Mockito.doNothing().when(mockJmsTemplate).convertAndSend("inbound.stix", jsonMessage);
		
		
		String msg = sender.sendMessage(jsonMessage);
		assertThat(msg, equalTo(jsonMessage));
	}
}
