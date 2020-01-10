package com.koreait.spring;

import java.util.HashSet;
import java.util.Set;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 * 	@Configuration
 * 	: 나는 appContext.xml 과 같은 역할을 수행하는 자바 클래스야!
 */

@Configuration
public class AnnoConfig {

	// Field
	
	// Constructor
	
	// Method
	
	/*
	 * 	@Bean
	 * 	: 이 메소드는 빈을 만드는 메소드야.
	 *    human1 이라는 id 를 가지는 Bean 을 만들 때 사용하는 메소드야.
	 */
	
	@Bean
	public Person human1() { // <bean id="human1" class="com.koreait.spring.Person">
		
		Set<String> hobbies = new HashSet<String>();
		hobbies.add("낚시");
		hobbies.add("스카이다이빙");
		hobbies.add("골프");
		
		Person person = new Person();
		person.setName("alice"); // <property name="name" value="alice" />
		person.setAge(20);
		person.setHobbies(hobbies);
		
		return person;
		
	}
	
	@Bean(name="human2") // @Bean(name="bean의id") // <Bean id="human2" class="com.koreait.spring.Person">
	public Person zzzzzz() {
		
		Set<String> hobbies = new HashSet<String>();
		hobbies.add("보드게임");
		hobbies.add("카드게임");
		
		Person person = new Person();
		person.setName("james"); // <property name="name" value="james" />
		person.setAge(21);
		person.setHobbies(hobbies);
		
		return person;
		
	}
	
	@Bean
	public PersonInfo pInfo() {
		
		Set<String> hobbies = new HashSet<String>();
		hobbies.add("하이킥");
		hobbies.add("로우킥");
		hobbies.add("암바");
		
		PersonInfo info = new PersonInfo();
		info.setPerson( new Person("정찬성", 30, hobbies) );
		
		return info;
		
	}
	
	
	
	
	
	
}