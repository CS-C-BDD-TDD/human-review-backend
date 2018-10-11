package gov.dhs.nppd.humanreview.repository;

import org.openapitools.model.HumanReviewItem;
import org.openapitools.model.ListOfHumanReviewItems;
import org.springframework.stereotype.Repository;

@Repository
public class HumanreviewRepository {

	public ListOfHumanReviewItems getPending() {
		ListOfHumanReviewItems listOfHumanReviewItems = new ListOfHumanReviewItems();
		HumanReviewItem hrItem1 = new HumanReviewItem();
		hrItem1.setStixId("42412345");

		listOfHumanReviewItems.add(hrItem1);
		return listOfHumanReviewItems;
	}

}
