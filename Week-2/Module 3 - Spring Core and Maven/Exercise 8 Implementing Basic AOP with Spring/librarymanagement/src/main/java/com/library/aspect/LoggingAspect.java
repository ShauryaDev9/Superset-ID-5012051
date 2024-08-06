package com.library.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class LoggingAspect {

    @Before("execution(* com.library.service.*.*(..))")
    public void logBeforeMethod() {
        System.out.println("LoggingAspect.logBeforeMethod: Method execution started");
    }

    @After("execution(* com.library.service.*.*(..))")
    public void logAfterMethod() {
        System.out.println("LoggingAspect.logAfterMethod: Method execution finished");
    }
}
