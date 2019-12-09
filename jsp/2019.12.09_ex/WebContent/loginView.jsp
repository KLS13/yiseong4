<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = (String)session.getAttribute("ID");
		String pw = (String)session.getAttribute("PW");
	%>
		<%= id %> 님 환영합니다.
	
		<input type="button" value="로그아웃" onclick="location='joinView.jsp'"/> 
</body>
</html>