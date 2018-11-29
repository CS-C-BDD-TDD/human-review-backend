package org.openapitools.repository.humanreview;

import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HumanreviewRepository extends CrudRepository<HumanReviewItem, String>{
	ListOfHumanReviewItems findAll();
	HumanReviewItem findByStixIdAndFieldLocation(String stixId, String fieldLocation);
	ListOfHumanReviewItems findByStixId(String stixId);
}
