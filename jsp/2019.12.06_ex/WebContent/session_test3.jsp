<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
</head>
<body>
	<%	
		//session 에 관리자의 id pw가 저장되어 있다.
		String id = (String)session.getAttribute("id");
		String pw = (String)session.getAttribute("pw");
	%>
	<h1>관리자 정보 확인</h1>
	<h3>접속 아이디 : <%= id %></h3>
	<h3>접속 패스워드 : <%= pw %></h3>
</body>
</html>