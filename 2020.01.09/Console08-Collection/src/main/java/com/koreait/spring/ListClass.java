package com.koreait.spring;

import java.util.List;

public class ListClass {

	private List<String> myList;
	
	public ListClass() {
		
	}

	//메소드
	public void showList() {
		for( String fruit : myList) {
			System.out.println(fruit);
		}
	}
	
	public List<String> getMyList() {
		return myList;
	}

	public void setMyList(List<String> myList) {
		this.myList = myList;
	}	
}
