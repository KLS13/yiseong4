<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${param.num1 gt param.num2}">
		  ${param.num1}
	</c:if>
	
	<br />
	
	<c:if test="${(param.num1 * param.num2) != 100}">
		${param.num1} * ${param.num2} 는 100 이 아닙니다.	
	</c:if>
</body>
</html>