<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<%
		request.setCharacterEncoding("utf-8");
		String title = request.getParameter("title");
	%>
<title><%=title %></title>
<style type="text/css">
	.wrap{
		font-size : 25px;
		width : 1000px;
		margin : auto;
	}
	.head-menu{
		width:100%;
		color:red;
	}
	.main-menu{
		width:100%;
		height:500px;
		color:blue;
	}
	
	.foot-menu{
		width:100%;
		color : green;
	}
</style>
</head>
<body>


	<div class="wrap">
		<div class="head-menu">
			홈 | 로그인 | 방명록 | 게시판
		</div>
		<div class = "main-menu">
			
