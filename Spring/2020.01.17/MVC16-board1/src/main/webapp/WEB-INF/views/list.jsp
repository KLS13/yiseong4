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
</style>
</head>
<body>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>순번</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
			</thead>
			<tbody>
				<c:forEach var="bDto" items="${list}">
					<tr>
						<td>${bDto.bIdx }</td>
						<td>${bDto.bWriter }</td>
						<!-- @RequestMapping("/view")  매핑값  view  -->
						<td><a href="view?bIdx=${bDto.bIdx}">${bDto.bTitle }</a></td>
						<td>${bDto.bDate }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<input type="button" value="새 글 작성하기" onclick="location.href='writePage'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>