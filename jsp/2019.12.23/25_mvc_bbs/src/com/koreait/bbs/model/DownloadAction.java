package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DownloadAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		String filename = request.getParameter("filename");
		request.setAttribute("filename", filename);
		request.setAttribute("path", "upload");
		
		return "bbs/download.jsp";
	}

}
