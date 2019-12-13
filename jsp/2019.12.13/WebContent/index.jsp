<%@page import="com.koreait.mybatis.GuestbookDao"%>
<%@page import="com.koreait.mybatis.GuestbookDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<style type="text/css">
	div {
		width: 700px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 700px;
		border-collapse: collapse;
	}
	td, th {
		border: 1px solid black;
		padding: 5px;
	}
	th:nth-of-type(1) {
		width: 100px;
	}
	th:nth-of-type(2) {
		width: 200px;
	}
	th:nth-of-type(3) {
		width: 200px;
	}
	th:nth-of-type(4) {
		width: 200px;
	}
</style>
</head>
<body>

	<%
		List<GuestbookDto> list = GuestbookDao.selectAll();
		pageContext.setAttribute("list", list);
	%>

	<div>
		<h1>방명록</h1>
		<p style="text-align: right;">
			<input type="button" value="글쓰기" onclick="location.href='write_page.jsp'" />
		</p>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="4">작성된 방명록이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.idx }</td>
								<td>${dto.writer }</td>
								<td><a href="view.jsp?idx=${dto.idx }">${dto.title }</a></td>
								<td>${dto.reg_date }</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>






