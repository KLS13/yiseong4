package com.koreait.spring;

import java.util.Iterator;
import java.util.Set;

public class SetClass {

	private Set<String> mySet;
	
	public SetClass() {
		
	}
	
	public void showSet() {
		Iterator<String> itr = mySet.iterator();
		while( itr.hasNext()) {
			System.out.println(itr.next());
		}
	}
	public Set<String> getMySet() {
		return mySet;
	}
	public void setMySet(Set<String> mySet) {
		this.mySet = mySet;
	}
}
