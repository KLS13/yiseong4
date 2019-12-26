<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String title = "환영합니다";
	request.setCharacterEncoding("utf-8");
	String paramTitle = request.getParameter("title");
	if ( paramTitle != null && !paramTitle.isEmpty() ) {
		title = paramTitle;
	}
	pageContext.setAttribute("title", title);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${title }</title>
<style type="text/css">
	.container {
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
</head>
<body>
	<div class="container">
		<div class="header">
			<c:choose>
				<c:when test="${loginDto eq null}"> 
					<a href="/26_mvc_member/loginPage.do">로그인</a> |
				</c:when>
				<c:otherwise>
					${loginDto.mName } 님 반갑습니다 ! &nbsp;&nbsp;
					<a href="/26_mvc_member/logoutPage.do">로그아웃</a> |
				</c:otherwise>
			</c:choose>
			 회원가입
		</div>
		<div class="main">