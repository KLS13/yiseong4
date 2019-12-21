package com.koreait.guestbook.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PageForInsert implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		return "guestbook/pageForInsert.jsp";
	}

}
