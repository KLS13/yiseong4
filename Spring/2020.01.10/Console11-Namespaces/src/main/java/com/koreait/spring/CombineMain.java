package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CombineMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:familyContext.xml","classpath:friendContext.xml");
		
		Family family1 = ctx.getBean("family1", Family.class);
		Friend middleFriend = ctx.getBean("middleFriend", Friend.class);
		
		System.out.println("가족 1 정보");
		System.out.println("아빠 : " + family1.getPapaName());
		System.out.println("엄마 : " + family1.getMamaName());
		System.out.println("============================================================");
		middleFriend.friendsInfo();
	}
}
