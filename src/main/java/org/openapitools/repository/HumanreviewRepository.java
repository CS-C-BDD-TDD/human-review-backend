package org.openapitools.repository;

import org.openapitools.model.AuthCredentials;
import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

public interface HumanreviewRepository extends CrudRepository<HumanReviewItem, String>{

//	public ListOfHumanReviewItems getPending() {
//		ListOfHumanReviewItems listOfHumanReviewItems = new ListOfHumanReviewItems();
//		HumanReviewItem hrItem1 = new HumanReviewItem();
//		hrItem1.setStixId("42412345");
//		hrItem1.setFieldName("Name");
//		hrItem1.setFieldValue("fieldValue");
//		hrItem1.setObjectType("objectType");
//
//		listOfHumanReviewItems.add(hrItem1);
//		return listOfHumanReviewItems;
//	}
	
	ListOfHumanReviewItems findAll();

}
