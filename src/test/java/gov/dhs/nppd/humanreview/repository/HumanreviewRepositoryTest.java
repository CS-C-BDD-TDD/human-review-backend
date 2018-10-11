package gov.dhs.nppd.humanreview.repository;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsEmptyCollection.empty;

import org.junit.Test;
import org.openapitools.model.ListOfHumanReviewItems;

public class HumanreviewRepositoryTest {
	@Test
	public void shouldGetPendingList() {
		HumanreviewRepository humanreviewRepository = new HumanreviewRepository();

		ListOfHumanReviewItems actualList = humanreviewRepository.getPending();

		assertThat(actualList, not(empty()));
		assertThat(actualList.get(0).getStixId(), equalTo("42412345"));
	}
}
