<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	table{
		border-collapse: collapse;
	}
	
	td,th {
		padding : 0 6px 0 6px;
	}
</style>
</head>
<body>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
					<th>이메일</th>
			</thead>
			<tbody>
				<c:if test="${result eq 0 }">
					<tr>
						<td colspan="4"> 게시물이 없습니다. </td>
					</tr>
				</c:if>
				<c:if test="${result ne 0 }">
				<c:forEach var="bDto" items="${list}">
					<tr>
						<td>${bDto.bIdx }</td>
						<!-- @RequestMapping("/view")  매핑값  view  -->
						<td><a href="view?bIdx=${bDto.bIdx}">${bDto.bName }</a></td>
						<td>${bDto.bTel}</td>
						<td>${bDto.bAddr }</td>
						<td>${bDto.bEmail }</td>
					</tr>
					
				</c:forEach>
			
				</c:if>
				<tr>
					<td colspan="5">총 주소록 수 : ${ result } 개</td>
				</tr>	
			</tbody>
			<tfoot>
			
				<tr>
					<th colspan="5">
						<input type="button" value="새 주소록 저장하기" onclick="location.href='writePage'" />
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>