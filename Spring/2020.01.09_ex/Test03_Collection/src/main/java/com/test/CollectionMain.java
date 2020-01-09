package com.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:Collection.xml");
		ListEx listobj = ctx.getBean("listTest", ListEx.class);
		listobj.printList();

		System.out.println("테스트 =============================");
		
		SetEx setobj = ctx.getBean("setTest", SetEx.class);
		setobj.printSet();
		
		System.out.println("테스트 =============================");
		
		MapEx mapobj = ctx.getBean("mapTest", MapEx.class);
		mapobj.printMap();
		
		ctx.close();
	}

}
