<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 받아서 최대값 구하기</title>
</head>
<body>
	<h1>EL을 이용해 최대값 구하기</h1>
	${param.num1 - param.num2 > 0 ? param.num1 : param.num2} <br /><br />
	<h1>JSTL을 이용해 큰 값 구하기</h1>
	
	<c:if test="${param.num1 - param.num2 gt 0 }">
		${param.num1} <br />
	</c:if>
	<c:if test="${param.num1 - param.num2 < 0 }">
		${param.num2} <br />
	</c:if>
</body>
</html>