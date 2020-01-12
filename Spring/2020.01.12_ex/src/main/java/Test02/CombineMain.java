package Test02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CombineMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:familyContext02.xml","classpath:friendContext02.xml","classpath:gameContext02.xml");
		// 클래스 패치에 2개 넣어주면 됨.
		
		Family family1 = ctx.getBean("family1", Family.class);
		Friend middleFriend = ctx.getBean("middleFriend", Friend.class);
		Game game = ctx.getBean("game", Game.class);
		
		System.out.println("가족 1 정보");
		System.out.println("아빠 : " + family1.getPapaName());
		System.out.println("엄마 : " + family1.getMamaName());
		System.out.println("============================================================");
		middleFriend.friendsInfo();
		System.out.println("============================================================");
		game.printGame();
	}
}
