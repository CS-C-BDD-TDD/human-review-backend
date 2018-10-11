package org.openapitools.api;

import java.util.Optional;

import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;

import io.swagger.annotations.ApiParam;
@javax.annotation.Generated(value = "org.openapitools.codegen.languages.SpringCodegen", date = "2018-10-11T09:52:13.189-04:00[America/New_York]")

@Controller
@RequestMapping("${openapi.humanReview.base-path:/api/v1}")
public class UserApiController implements UserApi {

    private final NativeWebRequest request;

    @org.springframework.beans.factory.annotation.Autowired
    public UserApiController(NativeWebRequest request, AuthCredentialsRepository authCredentialsRepository) {
        this.request = request;
        authCredentialsRepository = authCredentialsRepository;
    }

    @Override
    public Optional<NativeWebRequest> getRequest() {
        return Optional.ofNullable(request);
    }
    
    @Autowired
	AuthCredentialsRepository authCredentialsRepository;
    
    @Override
    public ResponseEntity<String> userUsernamePut(@ApiParam(value = "", defaultValue="null") @RequestParam(value="username", required=false)  String username,@ApiParam(value = "", defaultValue="null") @RequestParam(value="password", required=false)  String password){

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
