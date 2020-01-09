package com.test;

import java.util.Iterator;
import java.util.Set;

public class SetEx {
	
	private Set<String> set;
	
	public SetEx() { }
	
	public void printSet() {
		Iterator<String> itr = set.iterator();
		while( itr.hasNext()) {
			System.out.println(itr.next());
		}
	}

	public Set<String> getSet() {
		return set;
	}

	public void setSet(Set<String> set) {
		this.set = set;
	}
	
	
}
