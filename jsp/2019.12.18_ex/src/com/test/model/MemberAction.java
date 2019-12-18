package com.test.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MemberAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String agree = request.getParameter("agree");
		
		HttpSession session = request.getSession();
		
		session.setAttribute("id", id);
		session.setAttribute("pw", pw);
		session.setAttribute("name", name);
		session.setAttribute("email", email);
		session.setAttribute("agree", agree);
		
		return "join/joinResult.jsp";
	}

}
