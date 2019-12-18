package com.test.model;

import javax.servlet.http.HttpServletRequest;

public class LoginAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		request.setAttribute("login_id", id);
		request.setAttribute("login_pw", pw);
		
		return "login/loginResult.jsp";
	}

}
