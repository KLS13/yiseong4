package com.test;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class GameMain {

	public static void main(String[] args) {
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:Context.xml");
		
		GameInfo info = ctx.getBean("myGame", GameInfo.class);
		info.printGame();
		
		System.out.println("==================================================");
		
		Game g = ctx.getBean("game2", Game.class);  // Game 으로 생성하고  game2 를 불러냄.
		info.setGame(g); // Game 안에  g 를 넣어서 info를 초기화
		info.printGame();
		ctx.close();

	}

}
