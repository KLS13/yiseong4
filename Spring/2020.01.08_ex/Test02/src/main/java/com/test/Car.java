package com.test;

public class Car {

	private String model;
	private String company;
	private String driver;
	private int price;
	
	public Car() {
		super();
	}

	public Car(String model, String company, String driver, int price) {
		super();
		this.model = model;
		this.company = company;
		this.driver = driver;
		this.price = price;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getDriver() {
		return driver;
	}

	public void setDriver(String driver) {
		this.driver = driver;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
