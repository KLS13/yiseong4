package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainBMI {

	public static void main(String[] args) {
	
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		PersonInfo info = ctx.getBean("person1", PersonInfo.class);
		info.showPersonInfo();
		
		ctx.close();
	}
}
