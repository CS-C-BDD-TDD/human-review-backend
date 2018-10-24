package gov.dhs.nppd.humanreview.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Optional;

import javax.validation.Valid;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.eclipse.jetty.http.HttpStatus;
import org.openapitools.api.UserApi;
import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.NativeWebRequest;

import io.swagger.annotations.ApiParam;

@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class UserApiController implements UserApi {

	private final NativeWebRequest request;
	private static final Logger LOGGER = LogManager.getLogger(UserApiController.class);

	@org.springframework.beans.factory.annotation.Autowired
	public UserApiController(NativeWebRequest request, AuthCredentialsRepository authCredentialsRepository) {
		this.request = request;
	}

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}

	public AuthCredentialsRepository getAuthCredentialsRepository() {
		return authCredentialsRepository;
	}

	public void setAuthCredentialsRepository(AuthCredentialsRepository authCredentialsRepository) {
		this.authCredentialsRepository = authCredentialsRepository;
	}

	@Autowired
	AuthCredentialsRepository authCredentialsRepository;

	// By default the @CrossOrigin notation allows for any source for CORS request,
	// might
	// be a good idea to restrict this in the future.

	/**
	 * Getting an authentication token given user id & password.
	 * 
	 * @param AuthCredential object contains user id & password.
	 * @return success: a token in body & 200; fail: invalid credential & 401
	 */
	@CrossOrigin
	@Override
	public ResponseEntity<String> userPut(
			@ApiParam(value = "Allow the user to submit their credentials and on success return a token for use in making other REST calls", required = true) @Valid @RequestBody AuthCredentials authCredentials) {
		HttpHeaders headers = new HttpHeaders();
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		headers.add("Content-type", "text/plain");
		LOGGER.info("Checking user name and password for user:" + authCredentials.getUsername());
		AuthCredentials loginCheck = authCredentialsRepository.findByUsernameAndPassword(authCredentials.getUsername(),
				authCredentials.getPassword());
		String token;
		if (loginCheck == null) {
			token = "invalid credential";
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED_401).headers(headers).body(token);
		} else {
			token = "Random-" + Math.random();
			loginCheck.setToken(token);
			loginCheck.setDate(date);
			authCredentialsRepository.save(loginCheck);
			return ResponseEntity.status(HttpStatus.OK_200).headers(headers).body(token);
		}

	}
}
