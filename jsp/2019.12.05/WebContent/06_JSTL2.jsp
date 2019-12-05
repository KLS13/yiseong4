<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파라미터 받기</title>
</head>
<body>
	<c:choose>
		<c:when test="${param.num1 ge param.num2 }">
			<c:set var="start" value="${param.num2}"/>
			<c:set var="stop" value="${param.num1}"/>
		</c:when>
		<c:otherwise>
			<c:set var="start" value="${param.num1}"/>
			<c:set var="stop" value="${param.num2}"/>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="size" begin="${start}" end="${stop}" step="1">
		<font size="${size}">
		폰트 사이즈 : ${size} <br />
		</font>
	</c:forEach>
	
	<c:forEach var="foods" items="${paramValues.foods}"> <%-- 배열은 paramValues 로 불러옴. --%>
		${foods} <br />
	</c:forEach>
</body>
</html>