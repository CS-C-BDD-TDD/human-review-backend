package gov.dhs.nppd.humanreview.repository;

import static org.hamcrest.CoreMatchers.equalTo;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.collection.IsEmptyCollection.empty;

import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.model.ListOfHumanReviewItems;
import org.openapitools.repository.AuthCredentialsRepository;
import org.openapitools.repository.HumanreviewRepository;

public class HumanreviewRepositoryTest {
	@Test
	public void shouldGetPendingList() {
		HumanreviewRepository humanreviewRepository = Mockito.mock(HumanreviewRepository.class);

//		ListOfHumanReviewItems actualList = humanreviewRepository.getPending();
//
//		assertThat(actualList, not(empty()));
//		assertThat(actualList.get(0).getStixId(), equalTo("42412345"));
	}
}
