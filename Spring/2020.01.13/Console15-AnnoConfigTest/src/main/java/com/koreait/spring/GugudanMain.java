package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class GugudanMain {

	public static void main(String[] args) {

		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		Gugudan gugudan = ctx.getBean("gugu", Gugudan.class);
		gugudan.showGugudan();
		ctx.close();
		
	}

}
