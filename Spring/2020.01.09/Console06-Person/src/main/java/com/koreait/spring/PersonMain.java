package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PersonMain {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:Context.xml");
	
		PersonInfo info = ctx.getBean("personInfo",PersonInfo.class);
		info.showPersonInfo();
		
		
		Person p = ctx.getBean("person2", Person.class);
		info.setPerson(p);
		info.showPersonInfo();
		
		ctx.close();

	}
}
