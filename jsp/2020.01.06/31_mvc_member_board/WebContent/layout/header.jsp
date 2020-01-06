<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// title 처리
	request.setCharacterEncoding("utf-8");

	String title = "환영합니다"; // 기본제목
	String paramTitle = request.getParameter("title");
	if ( paramTitle != null && !paramTitle.isEmpty() ) {
		title = paramTitle;
	}
	// EL 사용을 위해서
	pageContext.setAttribute("title", title);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<style type="text/css">
	.wrap {
		width: 600px;
		margin: auto;
		text-align: center;
	}
	.header {
		text-align: right;
	}
	.header, .footer {
		width: 600px;
		box-sizing: border-box;
		border: 1px solid black;
		padding: 10px;
	}
	.main {
		width: 600px;
		height: 600px;
		box-sizing: border-box;
		padding-top: 50px;
	}
	a {
		text-decoration: none;
		color: red;
	}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	function logout() {
		if ( !confirm("로그아웃 하시겠습니까?") ) {
			return;
		}
		location.href = "/31_mvc_member_board/logout.me";
	}
</script>
</head>
<body>

	<div class="wrap">
		
		<div class="header">
			
			<!-- 로그인에 성공하면 session 에 loginDto 가 저장된다. -->
			
			<!-- 1. 로그인 / 로그아웃 -->
			<c:choose>
				<c:when test="${sessionScope.loginDto eq null }">
					<input type="button" value="로그인" onclick="location.href='/31_mvc_member_board/loginPage.me'" />
				</c:when>
				<c:otherwise>
					${sessionScope.loginDto.mName } 님 반갑습니다&nbsp;&nbsp;
					<input type="button" value="로그아웃" onclick="logout()" />
				</c:otherwise>
			</c:choose>
			
			<br /><br />
			
			<!-- 2. 회원가입 / 회원탈퇴 -->
			<c:choose>
				<c:when test="${sessionScope.loginDto eq null }">
					<a href="/31_mvc_member_board/joinPage.me">회원가입</a>
				</c:when>
				<c:otherwise>
					<a href="/31_mvc_member_board/leavePage.me">회원탈퇴</a>
				</c:otherwise>
			</c:choose>
			
			<br /><br />
			<!--  마이페이지  -->
			<c:choose>
				<c:when test="${sessionScope.loginDto eq null }">
					<a href="/31_mvc_member_board/loginPage.me">마이페이지</a>
				</c:when>
				<c:otherwise>
					<a href="/31_mvc_member_board/myPage.me">마이페이지</a>
				</c:otherwise>
			</c:choose>
			
			<!-- 게시판 -->
			<a href="/31_mvc_member_board/boardList.bo">게시판</a>
		</div>
		<div class="main">

		
		
		
		
		
		
		
		
		
		
		
		
		
		