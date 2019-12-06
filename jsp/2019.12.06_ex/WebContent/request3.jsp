<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 확인하기</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String entertainer = request.getParameter("entertainer");
		String player = request.getParameter("player");
	%>

	<h1>결과 확인</h1>


	<h3>표현식</h3>
	<ul>
		<li><%=entertainer %></li>
		<li><%=player %></li>
	</ul>

	<h3>표현언어</h3>
	<ul>
		<li>${param.entertainer }</li>
		<li>${param.player }</li>
	</ul>
	
	<h3>표현언어</h3>
	<ul>
		<li>${entertainer }</li>
		<li>${player }</li>
	</ul>
	
</body>
</html>