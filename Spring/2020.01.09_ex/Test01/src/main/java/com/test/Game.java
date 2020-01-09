package com.test;

public class Game {
	private String name;
	private String team;
	private String torunament;
	private String manager;
	
	public Game() { }

	public Game(String name, String team, String torunament, String manager) {
		super();
		this.name = name;
		this.team = team;
		this.torunament = torunament;
		this.manager = manager;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getTorunament() {
		return torunament;
	}

	public void setTorunament(String torunament) {
		this.torunament = torunament;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}
	
	
}
