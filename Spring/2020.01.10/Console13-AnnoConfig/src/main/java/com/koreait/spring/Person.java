package com.koreait.spring;

import java.util.ArrayList;

public class Person {
	
	//필드
	private String name;
	private ArrayList<String> hobbies;
	private double height;
	
	public Person() { }

	public Person(String name, ArrayList<String> hobbies, double height) {
		super();
		this.name = name;
		this.hobbies = hobbies;
		this.height = height;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<String> getHobbies() {
		return hobbies;
	}

	public void setHobbies(ArrayList<String> hobbies) {
		this.hobbies = hobbies;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}
}
