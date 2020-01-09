package com.koreait.spring;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainClass {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:appContext.xml");
		
		//"app" 빈 생성시 클래스 타입을 인터페이스로 지정한다.
		
		// 인터페이스로 지정하면 main을 변경할 일이 거의 없다.
		App app = ctx.getBean("app", App.class); 
		app.play();
		
		ctx.close();

	}

}
