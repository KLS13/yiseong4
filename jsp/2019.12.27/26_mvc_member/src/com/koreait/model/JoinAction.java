package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class JoinAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		MemberDto mDto = new MemberDto();
		mDto.setmId(request.getParameter("mId"));
		mDto.setmPw(request.getParameter("mPw"));
		mDto.setmName(request.getParameter("mName"));
		mDto.setmEmail(request.getParameter("mEmail"));
		mDto.setmPhone(request.getParameter("mPhone"));
		
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.getInsertMember(mDto);
		
		request.setAttribute("result", result); // 보여줄 곳에 파라미터로 전달
		
		return "join/joinResultPage.jsp"; // 보여줄 곳 ! 
	}

}
