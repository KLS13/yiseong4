package com.koreait.mvc03.dto;

// 자바빈 규약
// 1. 필드는 프로퍼티( Field 는 property ) private
// 2. 특정 패키지 소속이어야 한다.
// 3. 디폴트 생성자 생성.
// 4. getter setter 포함

public class PersonDto {

	// 필드
	private String name;
	private int age;
	private ContactDto contact;
	
	public PersonDto() { }

	public PersonDto(String name, int age, ContactDto contact) {
		super();
		this.name = name;
		this.age = age;
		this.contact = contact;
	}

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

	public ContactDto getContact() {
		return contact;
	}

	public void setContact(ContactDto contact) {
		this.contact = contact;
	}

	
}