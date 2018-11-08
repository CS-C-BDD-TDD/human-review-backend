package org.openapitools.repository;

import org.openapitools.model.JsonData;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

public interface JsonDataRepository extends CrudRepository<JsonData, Long> {

	void save(String string);

	JsonData findByStixId(String stixId);

	@Modifying
	@Query("update JsonData set modified_json=JSON_REPLACE(modified_json, fieldLocation, fieldValue) where stix_id=stixId")
	public void updateJson(@Param("field_location") String fieldLocation, @Param("field_value") String fieldValue,
			@Param("stixID") String stixId);

}
