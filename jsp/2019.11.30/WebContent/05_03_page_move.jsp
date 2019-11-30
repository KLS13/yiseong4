<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동</title>
</head>
<body>
	<%-- 1. parameter 저장/확인 --%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h1>페이지 이동의 마지막페이지 입니다.</h1>
	<div> 이름 = <%= name %></div>
	<div> 나이 = <%= age %></div>

	<hr />

</body>
</html>