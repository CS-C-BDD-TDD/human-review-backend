package org.openapitools.repository;

import org.openapitools.model.AuthCredentials;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface HumanreviewRepository extends CrudRepository<HumanReviewItem, String>{
	ListOfHumanReviewItems findAll();
	HumanReviewItem findByStixIdAndFieldName(String stixId, String fieldName);
}
