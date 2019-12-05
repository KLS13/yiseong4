<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	boolean result = Boolean.parseBoolean(request.getParameter("result"));
%>

<%if(result){ %>
	<h3>회원가입에 감사드립니다.</h3>
	<input type = "button" value = "로그인" onclick = "location.href='/loginView.jsp'">
<%} else { %>
	<h3>회원가입에 실패했습니다.</h3>
	<input type = "button" value = "뒤로가기" onclick = "history.back()">
<%} %>
