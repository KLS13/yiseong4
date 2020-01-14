package com.koreait.mvc09;

public class Calculator {

	// Field
	private int n1;
	private int n2;
	private String btn;
	private String nowOp;
	private double result;
	private String view;
	
	// Constructor
	public Calculator() {}
	public Calculator(int n1, int n2, String btn) {
		super();
		this.n1 = n1;
		this.n2 = n2;
		this.btn = btn;
	}
	
	// Method
	public int getN1() {
		return n1;
	}
	public void setN1(int n1) {
		this.n1 = n1;
	}
	public int getN2() {
		return n2;
	}
	public void setN2(int n2) {
		this.n2 = n2;
	}
	public String getBtn() {
		return btn;
	}
	public void setBtn(String btn) {
		this.btn = btn;
	}
	public String getNowOp() {
		return nowOp;
	}
	public void setNowOp(String nowOp) {
		this.nowOp = nowOp;
	}
	public double getResult() {
		return result;
	}
	public void setResult() {
		if ( btn.equals("덧셈") ) {
			nowOp = "+";
			btn = "뺄셈";
			result = n1 + n2;
			view = "output";
		} else if ( btn.equals("뺄셈") ) {
			nowOp = "-";
			btn = "곱셈";
			result = n1 - n2;
			view = "output";
		} else if ( btn.equals("곱셈") ) {
			nowOp = "*";
			btn = "나눗셈";
			result = n1 * n2;
			view = "output";
		} else if ( btn.equals("나눗셈") ) {
			nowOp = "/";
			btn = "초기화면";
			result = n1 / n2;
			view = "output";
		} else if ( btn.equals("초기화면") ) {
			view = "input";
		}
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
}
