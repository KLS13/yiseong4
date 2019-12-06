<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
/*
	session.removeAttribute("ID"); // 아이디만 삭제
	session.removeAttribute("CART"); // CART 만 삭제
*/
	session.invalidate(); // ID, CART 모두 삭제
	
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

</body>
</html>