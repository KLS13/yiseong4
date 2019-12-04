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
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>${id}</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>${pw}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${addr}</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>${tel}</td>
		</tr>
	</table>
</body>
</html>