package org.openapitools.repository.auth;

import org.openapitools.model.auth.AuthCredentials;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AuthCredentialsRepository extends CrudRepository<AuthCredentials, Long> {
	AuthCredentials findByUsernameAndPassword(String username, String password);
	AuthCredentials findByToken(String Token);
}
