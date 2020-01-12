package Test02;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class FriendMain {

	public static void main(String[] args) {
		
		AbstractApplicationContext ctx = new GenericXmlApplicationContext("classpath:friendContext.xml");
		
		Friend middleFriend = ctx.getBean("middleFriend", Friend.class);
		middleFriend.friendsInfo();
		
		Friend highFriend = ctx.getBean("highFriend", Friend.class);
		highFriend.friendsInfo();
		
		ctx.close();

	}

}
