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
	.disable {
		color: silver;
	}
	.now {
		color: red;
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
							<c:forEach varStatus="vs"  var="bdto" items="${list }">
								<tr>
									<td>${pvo.totalRecord - ((pvo.nowPage - 1) * pvo.recordPerPage + vs.index) }</td>
									<td><a href="/25_mvc_bbs/view.do?b_idx=${bdto.b_idx }&currentPage=${pvo.nowPage }" class="view">${bdto.title }</a></td>
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
							<%-- 페이징 처리 --%>
							<%-- 1. 이전 버튼 --%>
							<c:choose>
								<c:when test="${pvo.beginBlock <= pvo.pagePerBlock }">
									<span class="disable">◀&nbsp;</span>
								</c:when>
								<c:otherwise>
									<a class="view" href="/25_mvc_bbs/list.do?currentPage=${pvo.beginBlock - 1 }">◀&nbsp;</a>
								</c:otherwise>
							</c:choose>
							<%-- 2. 페이지 번호 --%>
							<c:forEach var="p" begin="${pvo.beginBlock }" end="${pvo.endBlock }" step="1">
								<c:choose>
									<c:when test="${p eq pvo.nowPage }">
										<span class="now">${p }&nbsp;</span>
									</c:when>
									<c:otherwise>
										<a class="view" href="/25_mvc_bbs/list.do?currentPage=${p }">${p }&nbsp;</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- 3. 다음 버튼 --%>
							<c:choose>
								<c:when test="${pvo.endBlock >= pvo.totalPage }">
									<span class="disable">&nbsp;▶</span>
								</c:when>
								<c:otherwise>
									<a class="view" href="/25_mvc_bbs/list.do?currentPage=${pvo.beginBlock + pvo.pagePerBlock }">&nbsp;▶</a>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</tfoot>
			</table>
			<p>
				<input type="submit" value="게시글 작성하기" />
			</p>
		</form>
	</div>
</body>
</html>