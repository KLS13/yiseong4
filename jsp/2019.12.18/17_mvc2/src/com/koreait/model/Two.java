package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class Two {
	public String command(HttpServletRequest request) {
		StringBuffer sb = new StringBuffer();
		
		for(int n = 1; n<=9 ; n++) {
			sb.append("2 x " + n + "=" + (2*n) + "<br />");
		}
		request.setAttribute("two", sb.toString());
		return "/view/output.jsp";
	}
}
