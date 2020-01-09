package com.test;

public class GameInfo {
	
	private Game game;
	
	public GameInfo() { }

	public GameInfo(Game game) {
		super();
		this.game = game;
	}
	
	public void printGame() {
		System.out.println("게임이름 : " + game.getName());
		System.out.println("팀 이름 : " + game.getTeam());
		System.out.println("참가 대회 : " + game.getTorunament());
		System.out.println("감독 이름 : " + game.getManager());
	}

	public Game getGame() {
		return game;
	}

	public void setGame(Game game) {
		this.game = game;
	}
	
	
}
