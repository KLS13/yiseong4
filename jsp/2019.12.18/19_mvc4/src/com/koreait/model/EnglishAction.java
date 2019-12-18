package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class EnglishAction implements Action {

	@Override
	public String command(HttpServletRequest request) {
		request.setAttribute("english", "hello");
		
		return "view/output.jsp";
	}

}
