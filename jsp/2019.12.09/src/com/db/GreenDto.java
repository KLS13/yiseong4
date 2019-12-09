package com.db;

import java.sql.Date;

// Green 테이블의 데이터 (행, row, record, tuple)를
// 객체(인스턴스)로 만들어 주는 클래스

// DTO : Data Transfer Object
// VO  : Value Object

public class GreenDto {

	
	// Field
	private int idx, age;
	private String id, pw, name, addr;
	private Date reg_date;
	
	
	// Constructor
	public GreenDto() {	}
	public GreenDto(int idx, int age, String id, String pw, String name, String addr, Date reg_date) {
		super();
		this.idx = idx;
		this.age = age;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.reg_date = reg_date;
	}


	// Method
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
