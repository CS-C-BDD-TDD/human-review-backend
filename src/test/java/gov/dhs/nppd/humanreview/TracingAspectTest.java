package gov.dhs.nppd.humanreview;

import org.aspectj.lang.JoinPoint;
import org.junit.Test;
import org.mockito.Mockito;

public class TracingAspectTest {
	private Object[] mockArgs = { "" };

	@Test
	public void shouldCallJoinPointArgsWithBefore() {
		TracingAspect tracingAspect = new TracingAspect();
		JoinPoint mockJoinPoint = Mockito.mock(JoinPoint.class);
		Mockito.when(mockJoinPoint.getArgs()).thenReturn(mockArgs);

		tracingAspect.before(mockJoinPoint);

		Mockito.verify(mockJoinPoint, Mockito.times(1)).getArgs();
	}

	@Test
	public void shouldCallJoinPointArgsWithAfter() {
		TracingAspect tracingAspect = new TracingAspect();
		JoinPoint mockJoinPoint = Mockito.mock(JoinPoint.class);
		Mockito.when(mockJoinPoint.getArgs()).thenReturn(mockArgs);

		tracingAspect.after(mockJoinPoint);

		Mockito.verify(mockJoinPoint, Mockito.times(1)).getArgs();
	}
}
