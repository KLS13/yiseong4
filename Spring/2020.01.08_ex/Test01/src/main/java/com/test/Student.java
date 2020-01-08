package com.test;

public class Student {
	private String name;
	private int score;
	private String grade;
	private String addr;
	
	public Student() { }

	public Student(String name, int score, String grade, String addr) {
		super();
		this.name = name;
		this.score = score;
		this.grade = grade;
		this.addr = addr;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	
}
