<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	td {
	text-align: center;
	}
	table {
	border-collapse: collapse;
	}
</style>
</head>
<body>
	<div>
	<h1>조회결과</h1>
		<table border="1">
			<thead>
				<tr>
					<th>아이디</th>
					<th>부서번호</th>
					<th>매니저번호</th>
					<th>성별</th>
					<th>이름</th>
					<th>급여</th>
					<th>직급</th>
					<th>입사일</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty list }">
					<c:forEach var="edto" items="${list }">
						<tr>
							<td>${edto.empId }</td>
							<td>${edto.empDeptNo }</td>
							<td>${edto.empManager }</td>
							<td>${edto.empGender }</td> 
							<td>${edto.empName }</td>
							<td>${edto.empSalary }</td>
							<td>${edto.empJobId }</td>
							<td>${edto.empHireDate}</td>
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