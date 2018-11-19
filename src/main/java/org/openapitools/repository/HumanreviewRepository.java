package org.openapitools.repository;

import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.data.repository.CrudRepository;

public interface HumanreviewRepository extends CrudRepository<HumanReviewItem, String>{
	ListOfHumanReviewItems findAll();
	HumanReviewItem findByStixIdAndFieldLocation(String stixId, String fieldLocation);
	ListOfHumanReviewItems findByStixId(String stixId);
}
