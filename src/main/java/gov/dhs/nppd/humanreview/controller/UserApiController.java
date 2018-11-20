package gov.dhs.nppd.humanreview.controller;

import java.util.Optional;

import javax.validation.Valid;

import org.openapitools.api.UserApi;
import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.NativeWebRequest;

import gov.dhs.nppd.humanreview.service.UserApiService;
import io.swagger.annotations.ApiParam;

@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class UserApiController implements UserApi {

	private final NativeWebRequest request;

	@org.springframework.beans.factory.annotation.Autowired
	public UserApiController(NativeWebRequest request, AuthCredentialsRepository authCredentialsRepository) {
		this.request = request;
	}

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}

	@Autowired
	UserApiService userApiService;

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
	
		return userApiService.userPut(authCredentials);

	}
}
