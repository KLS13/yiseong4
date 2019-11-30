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
	String op = request.getParameter("option");
	

	switch (op) {
	case "google" :
		response.sendRedirect("https://www.google.com");
		break;
	case "naver" :
		response.sendRedirect("https://www.naver.com");
		break;
	case "daum" :
		response.sendRedirect("https://www.daum.net");
		break;
	}
%>
</body>
</html>