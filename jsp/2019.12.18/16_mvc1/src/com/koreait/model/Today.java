package com.koreait.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class Today {

	//현재 날짜를 구하고,
	//어느 JSP 페이지로 이동할 것인지 정보를 Controller 에게 리턴
	
	public String process(HttpServletRequest request) {
		Calendar cal = Calendar.getInstance();
		
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		
		String today = year + "년" + month + "월" + day + "일";
		
		//현재 날짜 정보(요청에 대한 응답 정보)
		// request 나 session 에 속성값으로 등록
		request.setAttribute("today", today);
		
		//리턴
		//어느 jsp 페이지에서 결과를 출력할 것인가 ! ?
		return "view/output.jsp";
	}
	
}
