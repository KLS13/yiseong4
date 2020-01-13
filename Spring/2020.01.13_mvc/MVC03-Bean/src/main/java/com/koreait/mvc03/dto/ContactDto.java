package com.koreait.mvc03.dto;

public class ContactDto {

	private String phone;
	private String addr;
	
	public ContactDto() { }

	public ContactDto(String phone, String addr) {
		super();
		this.phone = phone;
		this.addr = addr;
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
