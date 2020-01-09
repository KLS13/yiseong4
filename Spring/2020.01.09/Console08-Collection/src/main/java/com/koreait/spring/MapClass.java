package com.koreait.spring;

import java.util.Iterator;
import java.util.Map;

public class MapClass {
	
	Map<String, String> myMap;
	
	public MapClass() { }
	
	public void showMap() {
		
		Iterator<String> itrKey = myMap.keySet().iterator();
		while(itrKey.hasNext()) {
			String key = itrKey.next();
			System.out.println(key + ":" + myMap.get(key));
		}
	}

	public Map<String, String> getMyMap() {
		return myMap;
	}

	public void setMyMap(Map<String, String> myMap) {
		this.myMap = myMap;
	}
}
