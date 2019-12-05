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
	<h1>향상 for문 형식의 forEach</h1>
	<%
		String[] names= {"alice", "smith", "james", "david", "samanda"};
		pageContext.setAttribute("NAMES", names);
	%>
	 	<ul>
		<c:forEach var="name" items="${NAMES}">
			<li>${name}</li>
		</c:forEach>
		</ul>
</body>
</html>