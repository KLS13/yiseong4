package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MyCalculatorMain {

	public static void main(String[] args) {
		
		String configLocation = "classpath:appContext.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		
		MyCalculator myCalculator = ctx.getBean("myCalculator", MyCalculator.class);
		
		myCalculator.addition();
		myCalculator.subtraction();
		myCalculator.multiplication();
		myCalculator.division();
		
		ctx.close();
		
	}

}
