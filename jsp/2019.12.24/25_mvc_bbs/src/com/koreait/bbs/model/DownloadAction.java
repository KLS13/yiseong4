package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("filename", request.getParameter("filename"));
		
		return "bbs/download.jsp";
		
	}

}
