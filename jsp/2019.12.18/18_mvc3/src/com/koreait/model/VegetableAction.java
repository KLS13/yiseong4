package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class VegetableAction implements Action {

	@Override
	public String command(HttpServletRequest request) {
		
		request.setAttribute("vegetable", "상추");
		
		return "view/output.jsp";
	}

}
