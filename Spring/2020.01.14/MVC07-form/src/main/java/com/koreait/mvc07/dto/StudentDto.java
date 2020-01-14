package com.koreait.mvc07.dto;

public class StudentDto {

	// Field
	private String name;
	private String dept; // 학과
	private int gradeNo; // 학년
	private int classNo; // 반

	// Constructor
	public StudentDto() {
		// TODO Auto-generated constructor stub
	}
	public StudentDto(String name, String dept, int gradeNo, int classNo) {
		super();
		this.name = name;
		this.dept = dept;
		this.gradeNo = gradeNo;
		this.classNo = classNo;
	}
	
	// Method
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}
	public int getGradeNo() {
		return gradeNo;
	}
	public void setGradeNo(int gradeNo) {
		this.gradeNo = gradeNo;
	}
	public int getClassNo() {
		return classNo;
	}
	public void setClassNo(int classNo) {
		this.classNo = classNo;
	}
	
}
