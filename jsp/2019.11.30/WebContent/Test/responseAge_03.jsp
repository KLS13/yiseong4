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
	request.setCharacterEncoding("utf-8");
	int age = Integer.parseInt(request.getParameter("age"));
%>
<h1>미성년자</h1>
당신의 나이는 <%= age %> 입니다.

<a href="responseAge_01.jsp">처음으로 이동</a>
</body>
</html>