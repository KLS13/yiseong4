<%@page import="com.koreait.mybatis.BDto"%>
<%@page import="java.util.List"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS</title>
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
	th:hover {
		font-size: x-small;
		background: gray;
		color : white;
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
		color : black;
	}
	a.view:hover {
		color : red;
		font-weight: bold;
	}
</style>
</head>
<body>

	<%
		// BDao 의 getList() 호출
		BDao bdao = BDao.getInstance();	// BDao 의 factory 생성
		List<BDto> list = bdao.getList();
		pageContext.setAttribute("list", list);	// EL 사용을 위해서  ( 4가지 영역안에 들어가야 EL 표기 사용 )
		
		// 게시물이 열린 경우 session 에 open 속성이 "YES" 값이 저장되는데.
		// session 에 open 속성이 있는 경우에는
		// session 에서 open 속성값을 삭제해야 한다
		String open = (String)session.getAttribute("open");
		if(open != null) {
			session.removeAttribute("open");
		}
	%>
	<div>
		<h1>BBS 게시판</h1>
		<form action="insert_page.jsp">
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
									<td><a href="view.jsp?b_idx=${bdto.b_idx }" class="view">${bdto.title }</a></td>
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
							페이지 번호 표시 영역
						</td>
					</tr>
				</tfoot>
			</table>
			<p>
				<input type="submit" value="게시글 작성하기" />
				
				<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
				<input type="hidden" name="" value="" />
			</p>
		</form>
	</div>
</body>
</html>