package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PersonMain {

	public static void main(String[] args) {

		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		
		Person p1 = ctx.getBean("person", Person.class);
		Person p2 = ctx.getBean("person", Person.class);
		
		if ( p1.equals(p2) ) {
			System.out.println("같은 객체이다.");
		} else {
			System.out.println("다른 객체이다.");
		}
		
		ctx.close();
		
	}

}
