package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class Three {

	public String command(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		
		for(int n = 1; n<=9 ; n++) {
			sb.append("3 x " + n + "=" + (3*n) + "<br />");
		}
		request.setAttribute("three", sb.toString());
		return "/view/output.jsp";
	}
}
