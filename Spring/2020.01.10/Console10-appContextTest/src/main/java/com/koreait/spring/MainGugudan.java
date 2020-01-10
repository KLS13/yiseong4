package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainGugudan {

	public static void main(String[] args) {
	
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		Gugudan info = ctx.getBean("myGugu", Gugudan.class);
		info.calculator();
		
		ctx.close();
	}
}
