<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 세션에 저장된 정보를 선택해서 삭제하기
	session.removeAttribute("name");

	//세션에 저장된 정보 확인을 위해 페이지 이동하기
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