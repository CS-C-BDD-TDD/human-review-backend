package gov.dhs.nppd.humanreview.util;

import java.util.Date;

import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class CommonUtil {

	@Autowired
	AuthCredentialsRepository authCredentialsRepository;

	//@Value("${gov.dhs.nppd.tokenTimeout}")
	private long tokenTimeout = 1800000;

	public boolean tokenValidator(String token) {
		System.out.println("Current Token to validate: " + token);

		if (token == null || token.isEmpty())
			return false;

		AuthCredentials tokenCheck = authCredentialsRepository.findByToken(token);

		
		
		Date afterAddingMins = new Date(tokenCheck.getDate().getTime() + tokenTimeout);
		Date now = new Date();

		
		System.out.println("****************************");
		System.out.println("Current Time: " + now);
		System.out.println("Token Login Time: " + tokenCheck.getDate()); 
		System.out.println("Token Expire Time: " + afterAddingMins );
		System.out.println("****************************");
		
		if (tokenCheck != null && !tokenCheck.getDate().after(now) && !afterAddingMins.before(now)) {
			return true;
		} else {
			return false;
		}
	}

	public AuthCredentialsRepository getAuthCredentialsRepository() {
		return authCredentialsRepository;
	}

	public void setAuthCredentialsRepository(AuthCredentialsRepository authCredentialsRepository) {
		this.authCredentialsRepository = authCredentialsRepository;
	}

}
