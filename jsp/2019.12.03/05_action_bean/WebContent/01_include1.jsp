<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:include</title>
</head>
<body>
	<h1>01_include1.jsp 페이지</h1>
	
	<hr /><br />
	<%-- 01_include1.jsp 페이지에 01_include2.jsp 페이지를 포함한다. --%>
	
	<%-- 1. include 지시어 --%>
	<%@ include file="01_include2.jsp" %>
	<hr /><br />
	<%-- 2. include 액션 --%>
	<jsp:include page="01_include2.jsp">
		<jsp:param value="홍길동" name="name"/>
		<jsp:param value="35" name="age"/>
		<jsp:param value="서울시 마포구" name="addr"/>
	</jsp:include>
</body>
</html>