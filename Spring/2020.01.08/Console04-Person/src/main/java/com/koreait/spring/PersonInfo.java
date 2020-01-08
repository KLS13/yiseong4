package com.koreait.spring;

public class PersonInfo {

	// Field
	private Person person;
	
	// Constructor
	public PersonInfo() { }
	public PersonInfo(Person person) {
		super();
		this.person = person;
	}
	
	// Method
	public void showPersonInfo() {
		System.out.println("이름 : " + person.getName());
		System.out.println("나이 : " + person.getAge());
		System.out.println("전화 : " + person.getPhone());
		System.out.println("주소 : " + person.getAddr());
	}
	public Person getPerson() {
		return person;
	}
	public void setPerson(Person person) {
		this.person = person;
	}
}