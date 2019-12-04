<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="id" value="java" scope="request" />
	<c:set var="pw" value="a213202" scope="request" />
	<c:set var="addr" value="seoul" scope="request" />
	<c:set var="tel" value="010-1234-5678" scope="application"/>
	<jsp:forward page="JSTL02.jsp"></jsp:forward>
</body>
</html>