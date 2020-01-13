package com.koreait.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class SamsungTV implements TV {

	// Field
	@Qualifier("apple")
	@Autowired
	private Speaker speaker;
	
	// Method
	/*
	public Speaker getSpeaker() {
		return speaker;
	}
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}
	*/
	@Override
	public void powerOn() {
		System.out.println("Samsung-TV Power On");
	}
	@Override
	public void powerOff() {
		System.out.println("Samsung-TV Power Off");
	}
	@Override
	public void volumeUp() {
		speaker.volumeUp();
	}
	@Override
	public void volumeDown() {
		speaker.vulumeDown();
	}

}
