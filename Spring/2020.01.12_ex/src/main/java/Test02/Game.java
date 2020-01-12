package Test02;

public class Game {

	private String game1;
	private String game2;
	
	public Game() { }

	public Game(String game1, String game2) {
		super();
		this.game1 = game1;
		this.game2 = game2;
	}
	
	public void printGame() { 
		System.out.println("게임 1 : " + game1);
		System.out.println("게임 2 : " + game2);
	
	}
}
