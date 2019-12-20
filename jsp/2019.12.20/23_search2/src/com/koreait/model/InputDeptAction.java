package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public class InputDeptAction implements Action {

	@Override
	public String process(HttpServletRequest request) {
		// 단순 화면 이동 해주는 모델.
		// 이동할 view만 리턴
		return "deptView.jsp";
	}

}
