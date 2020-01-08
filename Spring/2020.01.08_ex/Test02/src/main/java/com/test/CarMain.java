package com.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CarMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:Context.xml");
		CarInfo aa = ctx.getBean("myCar", CarInfo.class);
		aa.printCarInfo();
	}

}
