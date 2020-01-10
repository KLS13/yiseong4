package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class FamilyMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:familyContext.xml");
		
		Family family1 = ctx.getBean("family1", Family.class);
		System.out.println("가족 1 정보");
		System.out.println("아빠 : " + family1.getPapaName());
		System.out.println("엄마 : " + family1.getMamaName());
		
		Family family2 = ctx.getBean("family2", Family.class);
		System.out.println("가족 2 정보");
		System.out.println("아빠 : " + family1.getPapaName());
		System.out.println("엄마 : " + family1.getMamaName());
		ctx.close();

	}

}
