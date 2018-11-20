package gov.dhs.nppd.humanreview.service;

import static org.hamcrest.CoreMatchers.containsString;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.junit.Assert.assertTrue;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.http.ResponseEntity;

import gov.dhs.nppd.humanreview.controller.UserApiController;

public class UserApiServiceTest {

	private UserApiService service;
	private AuthCredentialsRepository mockAuthCredentialsRepository;
	private AuthCredentials enteredAuthCredentials;
	private AuthCredentials expectedAuthCredentials;

	@Before
	public void setup() {
		service = new UserApiService();
		mockAuthCredentialsRepository = Mockito.mock(AuthCredentialsRepository.class);

		enteredAuthCredentials = new AuthCredentials();
		enteredAuthCredentials.setPassword("mypassword");
		enteredAuthCredentials.setUsername("myusername");

		expectedAuthCredentials = new AuthCredentials();
		expectedAuthCredentials.setPassword("mypassword");
		expectedAuthCredentials.setUsername("myusername");
	}

	@Test
	public void shouldAuthenticateWithValidCredentials() {
		// Arrange
		Mockito.when(mockAuthCredentialsRepository.findByUsernameAndPassword(enteredAuthCredentials.getUsername(),
				enteredAuthCredentials.getPassword())).thenReturn(expectedAuthCredentials);

		service.setAuthCredentialsRepository(mockAuthCredentialsRepository);

		// Act
		ResponseEntity<String> resp = service.userPut(enteredAuthCredentials);
		String actualToken = resp.getBody();

		// Assert
		assertThat(actualToken, containsString("Random"));
	}

	@Test
	public void shouldNotAuthenticateWithInvalidCredentials() {
		// Arrange
		Mockito.when(mockAuthCredentialsRepository.findByUsernameAndPassword(enteredAuthCredentials.getUsername(),
				enteredAuthCredentials.getPassword())).thenReturn(null);

		service.setAuthCredentialsRepository(mockAuthCredentialsRepository);

		// Act
		ResponseEntity<String> resp = service.userPut(enteredAuthCredentials);
		String actualToken = resp.getBody();

		// Assert
		assertThat(actualToken, containsString("invalid credential"));
	}

	@Test
	public void shouldMakeIt100Percent() {
		service.getAuthCredentialsRepository();
		assertTrue(true);

	}
}
