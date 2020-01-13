package com.koreait.spring;

public class Person {

	// Field
	private String name;
	private int age;
	
	// Constructor
	public Person() {
		// TODO Auto-generated constructor stub
	}
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
	
	// Method
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}

}
