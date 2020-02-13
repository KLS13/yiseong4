package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public interface Action {

	public String process(HttpServletRequest request);
	
}
