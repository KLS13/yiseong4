package com.koreait.spring;

import java.util.ArrayList;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration  
public class AnnoConfig {
	
	@Bean // <bean>
	public Person person1() {
		ArrayList<String> hobbies = new ArrayList<String>();
		hobbies.add("노래듣기");
		hobbies.add("춤추기");
		hobbies.add("영화보기");
		
		Person person = new Person("lala", hobbies, 175.5 );
		
		return person;
	}
}
