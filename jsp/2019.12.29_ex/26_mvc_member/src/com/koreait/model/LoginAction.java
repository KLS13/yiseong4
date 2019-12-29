package com.koreait.model;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class LoginAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		String saveIdCheck = request.getParameter("saveIdCheck");
		
		// 아이디 기억하기 처리
		Cookie cookie = null;
		
		if(saveIdCheck != null) { // 아이디 기억하기를 체크했다는 의미
			cookie = new Cookie("saveId", mId); // 서버가 쿠키를 만들어서
			response.addCookie(cookie); // 클라이언트에게 쿠키를 전달
		}else { // 아이디 기억하기 체크를 안했다면
			// 기존에 저장된 saveId 쿠키값 있으면 삭제해줘야함. ( 삭제 안해주면 쿠키에 계속 남아있기 때문 )
			Cookie[] cookieBox = request.getCookies();
			for(Cookie ck : cookieBox) {
				if(ck.getName().equals("saveId")) {
					ck.setMaxAge(0); // 쿠키 유효기간 0 
					response.addCookie(ck);
					break;
				}
			}
		}
		
		// 로그인 처리
		// session 에 로그인 회원 정보 저장
		// 성공하면 header.jsp 에 "id님 반갑습니다"  로그인 --> 로그아웃 메뉴로 바껴서 노출
		// 실패하면 다시 loginPage.jsp 로 이동
		
		//DB에 전달할 조건 mDto
		MemberDto mDto = new MemberDto();
		mDto.setmId(mId);
		mDto.setmPw(mPw);


		
		//MemberDao 생성 및 DB처리
		MemberDao mDao = MemberDao.getInstance();
		mDto.setmId(mId);
		mDto.setmPw(mPw);
		mDto.setmPoint(mDao.getMemberUpdatePoint(mId));
		MemberDto loginDto = mDao.getMemberForLogin(mDto);

	
	
		// loginDto 를 session 에 저장
		if ( loginDto != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginDto", loginDto);
		}
	
		return "login/loginResultPage.jsp";
	}

}
