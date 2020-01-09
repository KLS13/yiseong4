package com.test;

import java.util.Iterator;
import java.util.Map;

public class MapEx {

	Map<String, String> map;
	
	public MapEx() { }
	
	public void printMap() {
		Iterator<String> itr = map.keySet().iterator();
		while(itr.hasNext()) {
			String key = itr.next();
			System.out.println(map.get(key));
		}
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}
}
