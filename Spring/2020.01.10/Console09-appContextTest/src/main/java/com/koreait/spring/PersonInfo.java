package com.koreait.spring;

import java.util.ArrayList;

public class PersonInfo {

	// Field
	private String name; // alice
	private double weight; // 55.5
	private double height; // 165.5
	private BMICalculator bmiCalculator;  
	private ArrayList<String> hobbies; // 최소3개
	
	// Constructor
	public PersonInfo() {
	
	}
	
	// Method
	public void showBMICalculator() {
		bmiCalculator.bmiInfo(height, weight);
	}
	
	public void showPersonInfo() { 
		System.out.println("성명 : " + name);
		System.out.println("키 : " + height);
		System.out.println("몸무게 : " + weight);
		showBMICalculator();
		System.out.println("취미 : " + hobbies);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public BMICalculator getBmiCalculator() {
		return bmiCalculator;
	}

	public void setBmiCalculator(BMICalculator bmiCalculator) {
		this.bmiCalculator = bmiCalculator;
	}

	public ArrayList<String> getHobbies() {
		return hobbies;
	}

	public void setHobbies(ArrayList<String> hobbies) {
		this.hobbies = hobbies;
	}
}