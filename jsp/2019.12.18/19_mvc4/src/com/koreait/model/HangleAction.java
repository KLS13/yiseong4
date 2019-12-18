package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class HangleAction implements Action {

	@Override
	public String command(HttpServletRequest request) {
		request.setAttribute("hangle", "안녕하세요");
		return "view/output.jsp";
	}
}
