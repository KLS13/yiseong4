package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		ListClass listObj = ctx.getBean("listBean", ListClass.class);
		listObj.showList();
		
		System.out.println("=============================================================");
		
		SetClass setobj = ctx.getBean("setBean", SetClass.class);
		setobj.showSet();  // set 은 중복불가로 런던 중복 --> 1개만 출력
		
		System.out.println("=============================================================");
		
		MapClass mapobj = ctx.getBean("mapBean", MapClass.class);
		mapobj.showMap();
		
		ctx.close();
	}
}
