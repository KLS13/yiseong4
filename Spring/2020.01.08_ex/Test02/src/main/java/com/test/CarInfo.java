package com.test;

public class CarInfo {
	
	private Car car;
	
	public CarInfo() { }

	public CarInfo(Car car) {
		super();
		this.car = car;
	}
	
	//메소드
	
	public void printCarInfo() {
		System.out.println("모델 : " + car.getModel());
		System.out.println("회사 : " + car.getCompany());
		System.out.println("운전자 명 : " + car.getDriver());
		System.out.println("가격 " + car.getPrice() + "만원");
	}

	public Car getCar() {
		return car;
	}

	public void setCar(Car car) {
		this.car = car;
	}
	
	
}
