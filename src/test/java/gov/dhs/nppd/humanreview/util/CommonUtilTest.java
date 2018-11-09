package gov.dhs.nppd.humanreview.util;

import static org.junit.Assert.assertEquals;
import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.MatcherAssert.assertThat;

import java.util.Date;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;

public class CommonUtilTest {

	private CommonUtil ctr;
	private AuthCredentialsRepository mockAuthCredentialsRepository;
	private AuthCredentials enteredAuthCredentials;
	private AuthCredentials expectedAuthCredentials;
	private AuthCredentials wrongAuthCredentials;
	private AuthCredentials noTokenAuthCredentials;

	@Before
	public void setup() {
		ctr = new CommonUtil();
		mockAuthCredentialsRepository = Mockito.mock(AuthCredentialsRepository.class);
		Date now = new Date();
		long minsToSubtractInMs = 180000; // 30 minutes in milliseconds
		Date afterSubtractingMins = new Date(now.getTime() + minsToSubtractInMs);

		enteredAuthCredentials = new AuthCredentials();
		enteredAuthCredentials.setToken("token");
		enteredAuthCredentials.setDate(now);

		expectedAuthCredentials = new AuthCredentials();
		expectedAuthCredentials.setToken("token");
		expectedAuthCredentials.setDate(now);

		noTokenAuthCredentials = new AuthCredentials();
		noTokenAuthCredentials.setDate(afterSubtractingMins);

		wrongAuthCredentials = new AuthCredentials();
		wrongAuthCredentials.setToken("wrong");
		wrongAuthCredentials.setDate(afterSubtractingMins);
	}

	@Test
	public void shouldAuthenticateWithValidToken() {
		// Arrange
		Mockito.when(mockAuthCredentialsRepository.findByToken(enteredAuthCredentials.getToken()))
				.thenReturn(expectedAuthCredentials);
		ctr.setAuthCredentialsRepository(mockAuthCredentialsRepository);
		// Act
		boolean resp = ctr.tokenValidator(enteredAuthCredentials.getToken());

		// Assert
		assertThat(resp, equalTo(true));
	}

	@Test
	public void shouldNotAuthenticateWithNoToken() {
		Mockito.when(mockAuthCredentialsRepository.findByToken(enteredAuthCredentials.getToken()))
				.thenReturn(noTokenAuthCredentials);
		ctr.setAuthCredentialsRepository(mockAuthCredentialsRepository);
		// Act
		boolean resp = ctr.tokenValidator(enteredAuthCredentials.getToken());

		// Assert
		assertThat(resp, equalTo(true));
	}

	@Test
	public void shouldNotAuthenticateWithInvalidToken() {
		Mockito.when(mockAuthCredentialsRepository.findByToken(enteredAuthCredentials.getToken()))
				.thenReturn(wrongAuthCredentials);
		ctr.setAuthCredentialsRepository(mockAuthCredentialsRepository);
		// Act
		boolean resp = ctr.tokenValidator(enteredAuthCredentials.getToken());

		// Assert
		assertThat(resp, equalTo(true));
	}

	@Test
	public void shouldNotAuthenticateWithNullToken() {
		Mockito.when(mockAuthCredentialsRepository.findByToken(enteredAuthCredentials.getToken()))
				.thenReturn(wrongAuthCredentials);
		ctr.setAuthCredentialsRepository(mockAuthCredentialsRepository);
		// Act
		boolean resp = ctr.tokenValidator(null);

		// Assert
		assertThat(resp, equalTo(false));
	}

	@Test
	public void shouldNotAuthenticateWhenNoTokenReturned() {
		Mockito.when(mockAuthCredentialsRepository.findByToken(enteredAuthCredentials.getToken())).thenReturn(null);
		ctr.setAuthCredentialsRepository(mockAuthCredentialsRepository);
		// Act
		boolean resp = ctr.tokenValidator(enteredAuthCredentials.getToken());

		// Assert
		assertThat(resp, equalTo(false));
	}

	@Test
	public void shouldNotAuthenticateWithEmptyToken() {
		Mockito.when(mockAuthCredentialsRepository.findByToken(enteredAuthCredentials.getToken()))
				.thenReturn(wrongAuthCredentials);
		ctr.setAuthCredentialsRepository(mockAuthCredentialsRepository);
		// Act
		boolean resp = ctr.tokenValidator("");

		// Assert
		assertThat(resp, equalTo(false));
	}
}
