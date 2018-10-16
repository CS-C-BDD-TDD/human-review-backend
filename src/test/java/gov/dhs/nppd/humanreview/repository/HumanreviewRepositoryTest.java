package gov.dhs.nppd.humanreview.repository;

import org.junit.Test;
import org.mockito.Mockito;
import org.openapitools.repository.HumanreviewRepository;
import org.springframework.beans.factory.annotation.Autowired;

public class HumanreviewRepositoryTest {
	@Autowired
	private HumanreviewRepository hrRepo;
	
	@Test
	public void shouldGetPendingList() {
		HumanreviewRepository humanreviewRepository = Mockito.mock(HumanreviewRepository.class);
	}
}
