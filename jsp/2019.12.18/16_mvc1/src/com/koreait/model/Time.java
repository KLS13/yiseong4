package com.koreait.model;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;

public class Time {
	public String process(HttpServletRequest request) {
		
		Calendar cal = Calendar.getInstance();
		
		int hour = cal.get(Calendar.HOUR);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
	
		String time = hour + "시" + minute + "분" + second + "초";
		
		request.setAttribute("time", time);
		
		return "view/output.jsp";
	}
}
