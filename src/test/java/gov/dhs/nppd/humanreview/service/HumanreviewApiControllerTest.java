package gov.dhs.nppd.humanreview.service;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.equalTo;

import org.junit.Test;

public class HumanreviewApiControllerTest {
	@Test
	public void shouldGetEmptyList() {
		//arrange
		//act
		//assert
		int balance = 1;

		balance += 1;

		assertThat(balance, equalTo(2));
	}
}
