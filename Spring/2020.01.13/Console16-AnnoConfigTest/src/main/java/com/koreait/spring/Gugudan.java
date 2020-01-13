package com.koreait.spring;

public class Gugudan {

	// Field
	private int startDan;
	private int endDan;
	private int startNum;
	private int endNum;
	private Calculator calculator;
	
	// Constructor
	public Gugudan() {
		// TODO Auto-generated constructor stub
	}
	
	// Method
	public void showGugudan() {
		for ( int num = startNum; num <= endNum; num++ ) {
			for ( int dan = startDan; dan <= endDan; dan++ ) {
				System.out.print(dan + "x" + num + "=" + calculator.multiplication(dan, num) + "\t");
			}
			System.out.println(); // 줄바꿈
		}
	}
	public int getStartDan() {
		return startDan;
	}
	public void setStartDan(int startDan) {
		this.startDan = startDan;
	}
	public int getEndDan() {
		return endDan;
	}
	public void setEndDan(int endDan) {
		this.endDan = endDan;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public Calculator getCalculator() {
		return calculator;
	}
	public void setCalculator(Calculator calculator) {
		this.calculator = calculator;
	}
	
}
