<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션정보 확인하기</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		session.setAttribute("player", request.getParameter("player"));
	%>

	<h1>결과 확인</h1>


	<h3>표현식</h3>
	<ul>
		<li><%=(String)session.getAttribute("entertainer") %></li>
		<li><%=(String)session.getAttribute("player") %></li>
	</ul>

	<h3>표현언어</h3>
	<ul>
		<li>${entertainer }</li>
		<li>${player }</li>
	</ul>
	
</body>
</html>