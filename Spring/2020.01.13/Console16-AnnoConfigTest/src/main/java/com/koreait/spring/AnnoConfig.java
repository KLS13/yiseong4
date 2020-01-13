package com.koreait.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

@ImportResource("classpath:appContext.xml")
@Configuration
public class AnnoConfig {

	@Bean
	public Calculator calc() {
		Calculator calculator = new Calculator();
		return calculator;
	}
	
}