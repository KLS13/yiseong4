package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class SearchPwAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		String mId = request.getParameter("mId");
		
		MemberDao mDao = MemberDao.getInstance();
		MemberDto mDto = mDao.getMemberBymId(mId);
		
		if ( mDto != null ) {
			HttpSession session = request.getSession();
			session.setAttribute("mDto", mDto);
		}
		
		return "login/searchPwResultPage.jsp";
		
	}

}
