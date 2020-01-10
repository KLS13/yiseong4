package com.koreait.spring;

// import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class PersonMain {

	public static void main(String[] args) {
		/* 1. AnnoConfig.java 를 이용한 Bean 생성
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
		Person p1 = ctx.getBean("person1", Person.class);
		System.out.println("성명 : " + p1.getName());
		System.out.println("키 : " + p1.getHeight());
		System.out.println("취미 : " + p1.getHobbies());
		
		2. appContext.xml 을 이용한 Bean 생성
		AbstractApplicationContext ctx2 = new GenericXmlApplicationContext("classpath:appContext.xml");
		Person p2 = ctx2.getBean("person2", Person.class);
		System.out.println("성명 : " + p2.getName());
		System.out.println("키 : " + p2.getHeight());
		System.out.println("취미 : " + p2.getHobbies());
		
		ctx.close();
		ctx2.close();
		*/
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		Person p1 = ctx.getBean("person1", Person.class);
		System.out.println("성명 : " + p1.getName());
		System.out.println("키 : " + p1.getHeight());
		System.out.println("취미 : " + p1.getHobbies());
		
		Person p2 = ctx.getBean("person2", Person.class);
		System.out.println("성명 : " + p2.getName());
		System.out.println("키 : " + p2.getHeight());
		System.out.println("취미 : " + p2.getHobbies());
		
	}

}
