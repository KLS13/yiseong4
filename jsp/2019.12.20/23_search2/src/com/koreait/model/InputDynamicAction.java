package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class InputDynamicAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		return "input_dynamic.jsp";
	}

}
