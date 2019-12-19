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
	<h1> 회원가입 완료</h1>
	<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty dto }">
					<c:forEach var="dto" items="${dto }">
						<tr>
							<td>아이디는 ${dto.id}</td>
							<td>${dto.name}님</td>
							<td>포인트는 ${dto.point}점 입니다.</td>
				
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="3">회원가입 실패</td>
					</tr>
				</c:if>
			</tbody>
		</table>
</body>
</html>