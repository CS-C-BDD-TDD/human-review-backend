package gov.dhs.nppd.humanreview.util;

import java.util.Date;

import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.apache.logging.log4j.Logger;
import org.apache.logging.log4j.LogManager;

@Component
public class CommonUtil {

	@Autowired
	AuthCredentialsRepository authCredentialsRepository;

	//@Value("${gov.dhs.nppd.tokenTimeout}")
	private long tokenTimeout= 1800000;

	private static final Logger LOGGER = LogManager.getLogger(CommonUtil.class);
	
	
	public boolean tokenValidator(String token) {
		LOGGER.debug("Current Token to validate: " + token);
		LOGGER.debug("Current tokenTimeout " + tokenTimeout);
		
		//Checking if token is null or empty
		if (token == null || token.isEmpty())
			return false;

		AuthCredentials tokenCheck = authCredentialsRepository.findByToken(token);

		//Checking if the check from the DB is null
		if(tokenCheck == null)
			return false;
		
		Date afterAddingMins = new Date(tokenCheck.getDate().getTime() + tokenTimeout);
		Date now = new Date();

		LOGGER.debug("****************************");
		LOGGER.debug("Current Time: " + now);
		LOGGER.debug("Token Issue Time: " + tokenCheck.getDate()); 
		LOGGER.debug("Token Expire Time: " + afterAddingMins );
		LOGGER.debug("****************************");
		
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
