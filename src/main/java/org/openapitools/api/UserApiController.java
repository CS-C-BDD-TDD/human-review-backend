package org.openapitools.api;

import org.openapitools.model.AuthCredentials;
import org.openapitools.model.User;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.NativeWebRequest;

import io.swagger.annotations.ApiParam;

import java.util.List;
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
	public String loginCheck(@ModelAttribute("user") User user) {
		System.out.println(" entering loginCheck");
		System.out.println(user.getUsername());
		System.out.println(user.getPassword());

		AuthCredentials loginCheck  = authCredentialsRepository.findByUsernameAndPassword(user.getUsername(), user.getPassword());		

		List<AuthCredentials> allUsers = (List<AuthCredentials>) authCredentialsRepository.findAll();
		System.out.println("Number of entries in DB: " + allUsers.size());
		System.out.println("DB Contents: " + allUsers.toString());
		
		if(loginCheck != null )
			System.out.println("Returned from DB: " + loginCheck.getUsername() + " " + loginCheck.getPassword());
		if (loginCheck == null ) {
			System.out.println("Username not found");
			return "403";
		}else if(!user.getPassword().matches( loginCheck.getPassword())) {
			System.out.println("Not a good password");
			return "403";
		}
		return "home";
	}

	@Override
	public Optional<NativeWebRequest> getRequest() {
		return Optional.ofNullable(request);
	}

	@Override
	public AuthCredentials loadUserByUsername(String username, String password) {
		AuthCredentials user = authCredentialsRepository.findByUsernameAndPassword(username, password);
		return user;
	}
	
	@Override
    public ResponseEntity<String> userPut(
            @ApiParam(value = "", defaultValue = "null") @RequestParam(value = "username", required = false) String username,
            @ApiParam(value = "", defaultValue = "null") @RequestParam(value = "password", required = false) String password) {

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "text/plain");
        AuthCredentials loginCheck = authCredentialsRepository.findByUsernameAndPassword(username, password);
        String token;
        if (loginCheck == null) {
        	token= "invalid credential";
        }else {
        	token = "Random-"+ Math.random();
        }
        return ResponseEntity.accepted().headers(headers).body(token);
    }

}
