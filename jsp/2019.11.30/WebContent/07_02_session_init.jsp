<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션의 모든 정보를 삭제하는 초기화 진행하기
	session.invalidate();
	// 다시 첫 화면으로 돌아가기
	response.sendRedirect("/03_jsp/07_01_session.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
</body>
</html>