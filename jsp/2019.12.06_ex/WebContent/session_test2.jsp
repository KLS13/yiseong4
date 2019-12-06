<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// 관리자의 id 가 "admin", pw가 "1234" 라고 가정하고
	// 관리자가 로그인을 했는지 확인한다.
	
	if( id.equals("admin") && pw.equals("1234")) {
		session.setAttribute("id", id);  //관리자의 id를 session 에 id 속성으로 저장한다.
		session.setAttribute("pw", pw);
		session.setAttribute("isAdmin", "yes"); //관리자의 경우 session에 isAdmin 속성이 yes로 저장.
	}else {
		session.setAttribute("isAdmin", "no"); //관리자가 아닌 경우 session에 isAdmin 속성이 no로 저장.
	}
	
	// 로그인 화면으로 되돌아가기
	response.sendRedirect("session_test1.jsp");
%>