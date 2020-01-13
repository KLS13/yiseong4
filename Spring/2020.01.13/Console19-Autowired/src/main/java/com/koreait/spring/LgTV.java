package com.koreait.spring;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class LgTV implements TV {
	
	// Field
	@Qualifier("bose") // bose 라는 빈을
	@Autowired // 자동으로 주입하라.
	private Speaker speaker;

	// Method
	/* appContext.xml 에서 사용하기 위해 추가된 getter/setter
	public Speaker getSpeaker() {
		return speaker;
	}
	public void setSpeaker(Speaker speaker) {
		this.speaker = speaker;
	}
	*/
	@Override
	public void powerOn() {
		System.out.println("LG-TV Power On");
	}
	@Override
	public void powerOff() {
		System.out.println("LG-TV Power Off");
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
