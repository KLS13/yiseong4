package com.koreait.spring;

public class MyCalculatorMain {

	public static void main(String[] args) {
		MyCalculator mCal1 = new MyCalculator();
		mCal1.setNum1(10);
		mCal1.setNum2(2);
		mCal1.setCalculator(new Calculator());

		mCal1.addition();
		mCal1.subtraction();
		mCal1.multiplication();
		mCal1.division();
		
		MyCalculator mCal2 = new MyCalculator(7, 2, new Calculator());
		
		mCal2.addition();
		mCal2.subtraction();
		mCal2.multiplication();
		mCal2.division();
	}
}
