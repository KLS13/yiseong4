<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String info = request.getParameter("info");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parameter 받기</title>
</head>
<body>
	
		<ul>
			<li>이름 : <%= name %></li>
			<li>나이 : <%= age %></li>
			<li>자기소개 : <%= info %></li>
		</ul>
</body>
</html>