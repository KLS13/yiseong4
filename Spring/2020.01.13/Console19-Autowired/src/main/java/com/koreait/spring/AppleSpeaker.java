package com.koreait.spring;

import org.springframework.stereotype.Component;

@Component("apple")
public class AppleSpeaker implements Speaker {

	// Field
	
	// Constructor
	
	// Method
	@Override
	public void volumeUp() {
		System.out.println("AppleSpeaker 볼륨 UP");
	}

	@Override
	public void vulumeDown() {
		System.out.println("AppleSpeaker 볼륨 DOWN");
	}

}
