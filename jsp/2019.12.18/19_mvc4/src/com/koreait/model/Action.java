package com.koreait.model;

import javax.servlet.http.HttpServletRequest;

public interface Action {

	public String command(HttpServletRequest request);
}
