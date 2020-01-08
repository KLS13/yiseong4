package com.test;

public class StudentInfo {

	private Student student;
	
	public StudentInfo() { }

	public StudentInfo(Student student) {
		super();
		this.student = student;
	}
	
	//메소드
	
	public void printStundetInfo() {
		System.out.println("이름 : " + student.getName());
		System.out.println("점수 : " + student.getScore() + ", 학점 : " + student.getGrade());
		System.out.println("주소 : " + student.getAddr());
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}
	
	
}
