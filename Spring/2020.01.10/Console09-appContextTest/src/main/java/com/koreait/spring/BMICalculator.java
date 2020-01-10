package com.koreait.spring;

public class BMICalculator {
	
	//bmi = 몸무게(kg) / 키*키(m단위)

	private double normal; // 정상(20~24),   20
	private double over;  // 과체중 ( 25~29), 25
	private double obesity; // 비만(30~ )  , 30
	
	public BMICalculator() { }
	
	public void bmiInfo(double height, double weight) {
		double h = height * 0.01;  //cm에서 m 단위로 변경
		double w = weight;
		double bmi = w / ( h * h );
		System.out.print("체질량(BMI) 지수 : " + bmi + "(");
		if(bmi > obesity ) {
			System.out.println("비만)");
		}else if( bmi > over ) {
			System.out.println("과체중)");
		}else if( bmi > normal ) {
			System.out.println("정상)");
		}else {
			System.out.println("저체중)");
		}
	}

	public double getNormal() {
		return normal;
	}

	public void setNormal(double normal) {
		this.normal = normal;
	}

	public double getOver() {
		return over;
	}

	public void setOver(double over) {
		this.over = over;
	}

	public double getObesity() {
		return obesity;
	}

	public void setObesity(double obesity) {
		this.obesity = obesity;
	}
	
	
}
