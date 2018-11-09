package gov.dhs.nppd.humanreview.util;

import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.openapitools.model.AuthCredentials;
import org.openapitools.repository.AuthCredentialsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CommonUtil {

	@Autowired
	AuthCredentialsRepository authCredentialsRepository;

	// @Value("${gov.dhs.nppd.tokenTimeout}")
	private long tokenTimeout = 1800000;

	private static final Logger LOGGER = LogManager.getLogger(CommonUtil.class);

	/**
	 * Validate a token. token expiration is defined as in gov.dhs.nppd.tokenTimeout
	 * property. Default is 30 minutes
	 * 
	 * @param token
	 * @return true if token is valid; false otherwise.
	 * 
	 */
	public boolean tokenValidator(String token) {
		LOGGER.info("Current Token to validate: " + token);
		LOGGER.info("Current tokenTimeout " + tokenTimeout);

		// Checking if token is null or empty
		if (token == null || token.isEmpty())
			return false;

		LOGGER.info("Afer Null: Current tokenTimeout " + tokenTimeout);
		AuthCredentials tokenCheck = authCredentialsRepository.findByToken(token);

		// Checking if the check from the DB is null
		if (tokenCheck == null)
			return false;

		long lastAccessTime = tokenCheck.getDate().getTime();
		long expiredTime = lastAccessTime + tokenTimeout;
		long currentTime = System.currentTimeMillis();

		LOGGER.info("****************************");
		LOGGER.info("Current Time: " + currentTime);
		LOGGER.info("Token Issue Time: " + lastAccessTime);
		LOGGER.info("Token Expire Time: " + expiredTime);
		LOGGER.info("****************************");

		return currentTime < expiredTime;
	}

	public AuthCredentialsRepository getAuthCredentialsRepository() {
		return authCredentialsRepository;
	}

	public void setAuthCredentialsRepository(AuthCredentialsRepository authCredentialsRepository) {
		this.authCredentialsRepository = authCredentialsRepository;
	}

}
