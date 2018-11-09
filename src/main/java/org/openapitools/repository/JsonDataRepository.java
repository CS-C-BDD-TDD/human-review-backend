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
	@Query("update JsonData set modified_json=JSON_REPLACE(modified_json, :field_location, :field_value) where stix_id=:stix_id")
	public void updateJson(@Param("field_location") String field_location, @Param("field_value") String field_value,
			@Param("stix_id") String stix_id);

}
