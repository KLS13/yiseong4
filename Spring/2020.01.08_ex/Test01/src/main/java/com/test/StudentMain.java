package com.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class StudentMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:Context.xml");
		StudentInfo info = ctx.getBean("myStu", StudentInfo.class);
		StudentInfo info2 = ctx.getBean("myStu2", StudentInfo.class);
		
		info.printStundetInfo();
		System.out.println("========================================");
		info2.printStundetInfo();
	}

}
