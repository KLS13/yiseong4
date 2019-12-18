package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class FruitAction implements Action {

	@Override
	public String command(HttpServletRequest request) {
		
		request.setAttribute("fruit", "사과");
		
		return "view/output.jsp";
	}

}
