package gov.dhs.nppd.humanreview.service;

import java.util.Date;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openapitools.model.auth.AuthCredentials;
import org.openapitools.repository.auth.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;

import io.swagger.annotations.ApiParam;

@Service
public class UserApiService {

	private static final Logger LOGGER = LogManager.getLogger(UserApiService.class);
	
	public AuthCredentialsRepository getAuthCredentialsRepository() {
		return authCredentialsRepository;
	}

	public void setAuthCredentialsRepository(AuthCredentialsRepository authCredentialsRepository) {
		this.authCredentialsRepository = authCredentialsRepository;
	}

	@Autowired
	AuthCredentialsRepository authCredentialsRepository;
	
	@HystrixCommand(fallbackMethod = "reliable")
	public ResponseEntity<String> userPut(
			@ApiParam(value = "Allow the user to submit their credentials and on success return a token for use in making other REST calls", required = true) @Valid @RequestBody AuthCredentials authCredentials) {
		HttpHeaders headers = new HttpHeaders();
		Date date = new Date();
		headers.add("Content-type", "text/plain");
		LOGGER.info("Checking user name and password for user:" + authCredentials.getUsername());
		AuthCredentials loginCheck = authCredentialsRepository.findByUsernameAndPassword(authCredentials.getUsername(),
				authCredentials.getPassword());
		String token;
		if (loginCheck == null) {
			token = "invalid credential";
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).headers(headers).body(token);
		} else {
			token = "Random-" + Math.random();
			loginCheck.setToken(token);
			loginCheck.setDate(date);
			authCredentialsRepository.save(loginCheck);
			return ResponseEntity.status(HttpStatus.OK).headers(headers).body(token);
		}
	}
	
	/**
	 * Circuit Break response if the system goes down/is overloaded. 
	 * @return The Bandwidth Limit Exceeded HTTP Status code along with same message in body
	 */
	public  ResponseEntity<String> reliable() {
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-type", "text/plain");
	    return ResponseEntity.status(HttpStatus.BANDWIDTH_LIMIT_EXCEEDED).headers(headers).body("Bandwidth Limit Exceeded");
	}
}
