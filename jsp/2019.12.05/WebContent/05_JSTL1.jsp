<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>반복문 forEach</title>
</head>
<body>
	<h1>일반 for문 형식의 forEach</h1>
	<c:forEach var="i" begin="1" end="10" step="1">
		${i} <br />
	</c:forEach>
	

</body>
</html>