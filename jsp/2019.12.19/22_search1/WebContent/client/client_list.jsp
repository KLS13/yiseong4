<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client 검색 결과</title>
</head>
<body>

	<div>
		<table>
			<thead>
				<tr>
					<th>고객번호</th>
					<th>성명</th>
					<th>주소</th>
					<th>SSN</th>
					<th>담당직원</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list }">
					<c:forEach var="cdto" items="${list }">
						<tr>
							<td>${cdto.cId }</td>
							<td>${cdto.cName }</td>
							<td>${cdto.cAddr }</td>
							<td>${cdto.cSSn }</td>
							<td>${cdto.cEmpId }</td>
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
	</div>

</body>
</html>