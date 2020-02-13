<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee 검색 결과</title>
</head>
<body>
	<div style="width: 800px; margin: auto; text-align: center;">
		<h1>Employee 검색 결과</h1>
		<c:choose>
			<c:when test="${key == 1 }"><h3>사원ID 검색 결과</h3></c:when>		
			<c:when test="${key == 2 }"><h3>이름 검색 결과</h3></c:when>		
			<c:when test="${key == 3 }"><h3>부서ID 검색 결과</h3></c:when>		
		</c:choose>
		<table border="1" style="width: 100%; margin: auto; border-collapse: collapse;">
			<thead>
				<tr>
					<th>직원ID</th>
					<th>성명</th>
					<th>연락처</th>
					<th>연봉</th>
					<th>부서ID</th>
					<th>고용일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list }">
					<c:forEach var="dto" items="${list }">
						<tr>
							<td>${dto.employee_id }</td>
							<td>${dto.first_name } ${dto.last_name }</td>
							<td>${dto.phone_number }</td>
							<td><fmt:formatNumber value="${dto.salary }" pattern="#,##0만원" /></td>
							<td>${dto.department_id }</td>
							<td><fmt:formatDate value="${dto.hire_date }" pattern="yyyy년 MM월 dd일 E요일" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="6">조건을 만족하는 직원이 없습니다.</td>
					</tr>
				</c:if>
			</tbody>
		</table>
	</div>
</body>
</html>