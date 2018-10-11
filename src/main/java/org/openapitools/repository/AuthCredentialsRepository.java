package org.openapitools.repository;

import org.openapitools.model.AuthCredentials;
import org.springframework.data.repository.CrudRepository;

public interface AuthCredentialsRepository extends CrudRepository<AuthCredentials, Long> {
	AuthCredentials findByUsernameAndPassword(String username, String password);
}
