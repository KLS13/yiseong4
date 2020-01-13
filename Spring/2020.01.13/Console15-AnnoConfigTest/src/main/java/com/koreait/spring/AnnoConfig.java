package com.koreait.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AnnoConfig {

	@Bean
	public Calculator calc() {
		Calculator calculator = new Calculator();
		return calculator;
	}
	
}