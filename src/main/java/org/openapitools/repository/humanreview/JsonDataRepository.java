package org.openapitools.repository.humanreview;

import org.openapitools.model.humanreview.JsonData;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface JsonDataRepository extends CrudRepository<JsonData, Long> {

	void save(String string);

	JsonData findByStixId(String stixId);

	@Modifying
	@Transactional
	@Query("update JsonData set modified_json=JSON_REPLACE(modified_json, :field_location, :field_value) where stix_id=:stix_id")
	public void updateJson(@Param("field_location") String field_location, @Param("field_value") String field_value,
			@Param("stix_id") String stix_id);

}
