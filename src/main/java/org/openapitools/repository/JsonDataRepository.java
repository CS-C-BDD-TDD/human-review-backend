package org.openapitools.repository;

import org.openapitools.model.JsonData;
import org.springframework.data.repository.CrudRepository;

public interface JsonDataRepository extends CrudRepository<JsonData, Long> {

	void save(String string); 
	JsonData findByStixId(String stixId);

}
