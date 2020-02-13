package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class InputDeptAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		// 단순 화면 이동을 위한 모델
		// 이동할 view 만 리턴
		return "input_dept.jsp";
	}

}
