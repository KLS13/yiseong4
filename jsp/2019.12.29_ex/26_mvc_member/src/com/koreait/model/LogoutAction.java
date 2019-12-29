package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		//session 에 저장된 loginDto 정보 삭제
		HttpSession session = request.getSession();
		session.invalidate(); // 세션 초기화
		
		return "index.jsp";
	}

}
