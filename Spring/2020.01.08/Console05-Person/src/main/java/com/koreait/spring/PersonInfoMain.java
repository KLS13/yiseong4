package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PersonInfoMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		
		PersonInfo personInfo = ctx.getBean("pInfo", PersonInfo.class);
		
		personInfo.showPersonInfo();
		
		ctx.close(); 
	}

}
