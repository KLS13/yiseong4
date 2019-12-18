package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

//작업지시서
//Action 인터페이스를 구현(implements)하는 모든 클래스들은
//Action 인터페이스에서 선언한 모든 메소드들을
//오버라이드(동일한 모양으로 만들어써야함) 해야한다.
public interface Action {
	public String command(HttpServletRequest request);
	
	
}
