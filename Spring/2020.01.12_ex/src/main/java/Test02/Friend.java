package Test02;

public class Friend {
	
	private String boyFriendName;
	private String girlFriendName;
	
	public Friend(String boyFriendName, String girlFriendName) {
		super();
		this.boyFriendName = boyFriendName;
		this.girlFriendName = girlFriendName;
	}
	
	public void friendsInfo() {
		System.out.println("남친 : " + boyFriendName);
		System.out.println("여친 : " + girlFriendName);
	}
}
