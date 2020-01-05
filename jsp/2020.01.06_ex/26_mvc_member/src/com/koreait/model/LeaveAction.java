package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class LeaveAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		MemberDto mDto = (MemberDto) session.getAttribute("loginDto");
		String mId = mDto.getmId(); // 로그인 된 회원의 아이디가 탈퇴할 회원의 아이디가 됨.
		session.invalidate();
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.getDeleteMember(mId);
		request.setAttribute("result", result);
		
		return "join/leaveResultPage.jsp";
	}
}
