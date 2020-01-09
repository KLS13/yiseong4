package com.test;

import java.util.List;

public class ListEx {

	private List<String> list;
	
	public ListEx() { }
	
	public void printList() {
		for(String p : list) {
			System.out.println("게임명 : " + p);
		}
	}

	public List<String> getList() {
		return list;
	}

	public void setList(List<String> list) {
		this.list = list;
	}
	
	
}
