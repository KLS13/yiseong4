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
	<%-- 변수를 request 에 선언 --%>
	<c:set var="name" value="alice" scope="request" />
	<c:set var="addr" value="texax" scope="request" />
	<c:set var="phone" value="010-1111-1234" scope="request" />
	<%-- request를 전달하는 forward --%>
	<jsp:forward page="02_JSTL2.jsp"/>
</body>
</html>