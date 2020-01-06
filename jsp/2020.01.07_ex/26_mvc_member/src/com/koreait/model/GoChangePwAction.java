package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoChangePwAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		return "login/changePwPage.jsp";
	}

}