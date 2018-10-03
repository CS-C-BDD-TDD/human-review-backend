package org.openapitools.api;

import org.openapitools.model.AuthCredentials;
import org.openapitools.model.User;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.NativeWebRequest;

import java.util.Optional;

@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-09-28T12:48:27.866-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class UserApiController implements UserApi {

	private final NativeWebRequest request;
	@Autowired
	AuthCredentialsRepository authCredentialsRepository;

	@Autowired
	public UserApiController(NativeWebRequest request, AuthCredentialsRepository authCredentialsRepository) {
		this.request = request;
		authCredentialsRepository = authCredentialsRepository;
	}

	@RequestMapping(value = "/login")
	public String login() {
		System.out.println(" logging in");
		return "login";
	}

	@RequestMapping(value = "/loginCheck", method = RequestMethod.POST)
	@ResponseBody
	public String loginCheck(@ModelAttribute("user") User user) {
		System.out.println(" entering loginCheck");
		System.out.println(user.getUsername());

		AuthCredentials loginCheck = authCredentialsRepository.findByUsername(user.getUsername());

		if (loginCheck == null) {
			return "403";
		}
		return "home";

	}

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}

	@Override
	public AuthCredentials loadUserByUsername(String username) {
		AuthCredentials user = authCredentialsRepository.findByUsername(username);
		return user;
	}

}
