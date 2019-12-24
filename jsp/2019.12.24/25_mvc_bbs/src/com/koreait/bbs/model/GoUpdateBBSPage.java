package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GoUpdateBBSPage implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		return "bbs/update_page.jsp";
	}

}