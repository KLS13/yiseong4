package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class TvMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		
		TV tv = ctx.getBean("samsungtv", TV.class);
		
		tv.powerOn();
		tv.powerOff();
		tv.volumeUp();
		tv.volumeDown();
		
		ctx.close();
		
	}

}
