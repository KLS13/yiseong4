<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>포인트</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.id} 님 환영합니다.</td>
							<td>${dto.name}님 이시군요 !</td>
							<td>포인트는 ${dto.point} 점 입니다.</td>
				
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">조건을 만족하는 고객이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	
</body>
</html>