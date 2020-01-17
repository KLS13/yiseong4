<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Spring 게시판</title>
</head>
<body>
	<div>
		<table border="1">
			<thead>
				<tr>
					<td>순번</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="bDto" items="${list }">
					<tr>
						<td>${bDto.bIdx }</td>
						<td>${bDto.bWriter }</td>
						<!-- @RequestMapping("/view") -->
						<td><a href="view?bIdx=${bDto.bIdx}">${bDto.bTitle }</a></td>
						<td>${bDto.bDate }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<input type="button" value="새글 작성하기" onclick="location.href='writePage'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>