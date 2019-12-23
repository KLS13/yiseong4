<%@page import="com.koreait.dto.BDto"%>
<%@page import="com.koreait.dao.BDao"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시판</title>
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
	th {
		background: dodgerblue;
	}
	td, th {
		border: 1px solid black;
		padding: 5px;
	}
	th:nth-of-type(1) {
		width: 50px;
	}
	th:nth-of-type(2) {
		width: 300px;
	}
	th:nth-of-type(3) {
		width: 100px;
	}
	th:nth-of-type(4) {
		width: 180px;
	}
	th:nth-of-type(5) {
		width: 70px;
	}
	a.view {
		text-decoration: none;
		color: black;
	}
	a.view:hover {
		font-weight: bold;
	}
	ul.paging {
		list-style-type: none;
		overflow: hidden;
	}
	ul.paging li {
		float: left;
		margin: 10px;

	}
	
	ul.paging li a {
		padding: 3px 7px;
		display: block;
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
	ul.paging li a:hover {
		background-color: limegreen;
		font-size : x-large;
		font-weight: bold;
	}
	ul.paging li.disable {
		color: silver;
	}
	ul.paging li.now {
		border: 2px solid red;
		background-color: pink;
		color: white;
		font-size : x-large;
		font-weight: bold;
	}
</style>
</head>
<body>
	<div>
		<h1>BBS 게시판</h1>
		<form action="/25_mvc_bbs/insertBBSPage.do">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>날짜</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${not empty list }">
							<c:forEach var="bdto" items="${list }">
								<tr>
									<td>${bdto.b_idx }</td>
									<td><a href="/25_mvc_bbs/view.do?b_idx=${bdto.b_idx}" class="view">${bdto.title }</a></td>
									<td>${bdto.writer }</td>
									<td>${bdto.reg_date }</td>
									<td>${bdto.hit }</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5">게시물이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="5">
							<!-- 페이징 처리 -->
							
						</td>
					</tr>
				</tfoot>
			</table>
			<p>
				<input type="submit" value="게시글 작성하기" />
				
				<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
				<input type="hidden" name="currentPage" value="" />
			</p>
		</form>
	</div>

</body>
</html>