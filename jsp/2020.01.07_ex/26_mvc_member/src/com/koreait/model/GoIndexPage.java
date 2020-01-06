package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoIndexPage implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		return "index.jsp";
	}

}
