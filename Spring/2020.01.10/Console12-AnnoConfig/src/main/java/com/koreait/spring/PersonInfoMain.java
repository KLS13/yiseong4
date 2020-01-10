package com.koreait.spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class PersonInfoMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
		Person person1 = ctx.getBean("human1", Person.class);
		System.out.println("성명 : " + person1.getName());
		System.out.println("나이 : " + person1.getAge());
		System.out.println("취미 : " + person1.getHobbies());
		
		Person person2 = ctx.getBean("human2", Person.class);
		System.out.println("성명 : " + person2.getName());
		System.out.println("나이 : " + person2.getAge());
		System.out.println("취미 : " + person2.getHobbies());
		
		PersonInfo personInfo = ctx.getBean("pInfo", PersonInfo.class);
		personInfo.info();
		ctx.close();
	}

}
