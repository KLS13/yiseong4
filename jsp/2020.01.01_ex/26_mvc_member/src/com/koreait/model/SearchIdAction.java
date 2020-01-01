package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class SearchIdAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
	
		String mEmail = request.getParameter("mEmail");
		
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = mDao.getMemberBymEmail(mEmail);
		
		request.setAttribute("mDto", mDto);
		
		return "login/searchIdResultPage.jsp";
	}

}
