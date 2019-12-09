<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int result = Integer.parseInt(request.getParameter("result"));		
	String id = request.getParameter("user_id");
%>

<%if(result > 0){ %>
	<h3>회원가입에 감사드립니다.</h3>
	<input type = "button" value = "로그인" onclick = "location.href='login.jsp'">
<%} else { %>
	<h3>회원가입에 실패했습니다.</h3>
	<input type = "button" value = "뒤로가기" onclick = "history.back()">
<%} %>
