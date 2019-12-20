<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 부서 조회 목록 </title>
</head>
<body>
	<div>
		<table border="1">
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
							<td>${dto.first_name }</td>
							<td>${dto.phone_number }</td>
							<td>${dto.salary }</td>
							<td>${dto.department_id }</td>
							<td>${dto.hire_date }</td>
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