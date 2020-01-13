package com.koreait.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AnnoConfig {

	@Bean
	public Calculator calc() {
		return new Calculator();
	}
	
	@Bean
	public Gugudan gugu() {		// ctx.getBean("gugu", Gugudan.class);
		Gugudan gugudan = new Gugudan();
		gugudan.setStartDan(2);
		gugudan.setEndDan(9);
		gugudan.setStartNum(1);
		gugudan.setEndNum(9);
		gugudan.setCalculator(calc());
		return gugudan;
	}
	
}
