package com.koreait.spring;

import org.springframework.stereotype.Component;

// 내가 bose 다.
@Component("bose")
public class BoseSpeaker implements Speaker {

	// Field
	
	// Constructor
	
	// Method
	@Override
	public void volumeUp() {
		System.out.println("BoseSpeaker 볼륨 UP");
	}

	@Override
	public void vulumeDown() {
		System.out.println("BoseSpeaker 볼륨 DOWN");
	}

}
