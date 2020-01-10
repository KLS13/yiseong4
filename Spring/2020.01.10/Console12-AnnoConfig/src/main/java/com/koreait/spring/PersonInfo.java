package com.koreait.spring;

public class PersonInfo {

		private Person person;
	
		public PersonInfo() { }
		
		public void info() {
			System.out.println("성명 : " + person.getName());
			System.out.println("나이 : " + person.getAge());
			System.out.println("취미 : " + person.getHobbies());
		}

		public Person getPerson() {
			return person;
		}

		public void setPerson(Person person) {
			this.person = person;
		}
		
}
