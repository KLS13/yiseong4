package com.koreait.spring;

public class Gugudan {

	private InputInfo info;
	private int num1;
	private int num2;
	private int limit1;
	private int limit2;

	public Gugudan() {
	}

	public void start() {
		info.print(num1, num2);
	}

	public void calculator() { 
		start();
		for(int i=num1; i <= num2; i++) {
			System.out.println("");
			for(int j=limit1 ; j <= limit2 ; j++) {
				System.out.print(i + "*" + j + "=" + (i * j) + "\t");
			}
		}
	}

	public InputInfo getInfo() {
		return info;
	}

	public void setInfo(InputInfo info) {
		this.info = info;
	}

	public int getNum1() {
		return num1;
	}

	public void setNum1(int num1) {
		this.num1 = num1;
	}

	public int getNum2() {
		return num2;
	}

	public void setNum2(int num2) {
		this.num2 = num2;
	}

	public int getLimit1() {
		return limit1;
	}

	public void setLimit1(int limit1) {
		this.limit1 = limit1;
	}

	public int getLimit2() {
		return limit2;
	}

	public void setLimit2(int limit2) {
		this.limit2 = limit2;
	}
	
}
