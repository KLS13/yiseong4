package com.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class InterfaceMain {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:testContext.xml");
		
		Event ev = ctx.getBean("ev", Event.class);
		Event en = ctx.getBean("en", Event.class);
		
		ev.action();
		en.action();
		
		ctx.close();
		
	}

}
