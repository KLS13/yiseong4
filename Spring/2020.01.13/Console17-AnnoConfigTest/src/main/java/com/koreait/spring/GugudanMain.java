package com.koreait.spring;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class GugudanMain {

	public static void main(String[] args) {
		
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
		Gugudan gugudan = ctx.getBean("gugu", Gugudan.class);
		gugudan.showGugudan();
		ctx.close();

	}

}
