package com.koreait.spring;

public class Person {

	// Field (spring bean configuration file : XML 파일에서는 property)
	private String name;
	private int age;
	private String phone;
	private String addr;
	
	// Constructor
	public Person() { }
	public Person(String name, int age, String phone, String addr) {
		super();
		this.name = name;
		this.age = age;
		this.phone = phone;
		this.addr = addr;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}