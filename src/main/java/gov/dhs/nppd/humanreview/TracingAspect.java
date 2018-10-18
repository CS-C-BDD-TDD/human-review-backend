package gov.dhs.nppd.humanreview;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TracingAspect {

	Logger logger = LoggerFactory.getLogger(TracingAspect.class);

	@Before("execution(* gov.dhs.nppd.humanreview..*.*(..))")
	public void before(JoinPoint joinPoint) {
		StringBuilder sb = new StringBuilder();
		for (Object arg : joinPoint.getArgs()) {
			sb.append(arg).append(" --- ");
		}
		logger.info(">>>> Entering for {}", joinPoint);
		logger.info(">>>> args {}", sb.toString());
	}

	@After("execution(* gov.dhs.nppd.humanreview..*.*(..))")
	public void after(JoinPoint joinPoint) {
		logger.info(">>>> Leaving for {}", joinPoint);
	}
}