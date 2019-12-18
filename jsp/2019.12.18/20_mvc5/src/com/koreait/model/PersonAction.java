package com.koreait.model;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.koreait.dto.PersonDto;

public class PersonAction {
	
	public String process( HttpServletRequest request) {
		//input.jsp --> Controller --> 지금 위치
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String phone = request.getParameter("phone");
		String addr = request.getParameter("addr");
		String self = request.getParameter("self");
		
		//request 이용
		request.setAttribute("name", name);
		request.setAttribute("age", age);
		request.setAttribute("phone", phone);
		request.setAttribute("addr", addr);
		request.setAttribute("self", self);

		//session 이용
		// session은 JSP 에서 내장객체.  곧바로 사용 가능
		// 자바 에서는 request를 통해서 session 을 얻어낸다. getSession() 메소드
		// session의 타입은 HttpSession 이다.
		HttpSession session = request.getSession();
		session.setAttribute("name", "session" + name);
		session.setAttribute("age", "session" + age);
		session.setAttribute("phone", "session" +  phone);
		session.setAttribute("addr", "session" +  addr);
		session.setAttribute("self", "session" +  self);
		
		// 3. Dto 이용
		PersonDto dto = new PersonDto();
		dto.setName(name);
		dto.setAge(age);
		dto.setPhone(phone);
		dto.setAddr(addr);
		dto.setSelf(self);
		session.setAttribute("dto", dto);
		//이동할 JSP 리턴
		
		//Map 이용
		Map<String, String> map = new HashMap<String, String> ();
		map.put("name",name);
		map.put("age",age);
		map.put("phone",phone);
		map.put("addr",addr);
		map.put("self",self);
		session.setAttribute("map", map);
		
		
		return "view/output.jsp";
	}
}
