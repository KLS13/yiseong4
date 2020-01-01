package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class ChangePwAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터 mPw : 변경할 패스워드
		String mPw = request.getParameter("mPw");
		
		// 패스워드를 변경하고자 하는 회원 mDto (session 에 저장되어 있음)
		HttpSession session = request.getSession();
		MemberDto mDto = (MemberDto)session.getAttribute("mDto");
		
		// 변경할 패스워스를 가진 mDto 로 설정
		mDto.setmPw(mPw);
		
		// MemberDao 생성 및 DB 처리
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.getUpdatemPw(mDto);
		
		// 결과 저장
		request.setAttribute("result", result);
		
		// session 에서 mDto 정보 삭제
		session.removeAttribute("mDto");
		
		return "login/changePwResultPage.jsp";
		
	}

}
