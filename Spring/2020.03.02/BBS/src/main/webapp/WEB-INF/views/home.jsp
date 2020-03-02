<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>시크릿톡</title>
<style>
.mainPic {
	width: 1400px;
	margin: 0 auto;
	overflow: hidden;
}

.pic {
	width: 500px;
	height: 500px;
	margin: 0 auto;
	overflow: hidden;
}

.menu{
	width:1200px;
	height: 40px;
	margin: 0 auto;
	margin-bottom: 100px;
}


#topMenu ul li {
	list-style: none;
	color: white;
	background-color: #2d2d2d;
	float: left;
	line-height: 40px;
	vertical-align: middle;
	text-align: center;
}

#topMenu .talkmenu {
	text-decoration: none;
	color: white;
	display: block;
	width: 290px;
	font-size: 12px;
	font-weight: bold;
	font-family: "Trebuchet MS", Dotum, Arial;
}

#topMenu .menuLink:hover {
	color: red;
	background-color: #4d4d4d;
}
</style>
<title>Home</title>
</head>
<body>
	<div class="mainPic">
		<div class="menu">
			<nav id="topMenu">
				<ul>
					<li><a class="talkmenu" href="http://localhost:9090/">홈</a></li>
					<li>
					<c:if test="${empty pageContext.request.userPrincipal.name}">
					<a class="talkmenu" href="/loginform.it">로그인</a>				
					</c:if>
					<c:if test="${!empty pageContext.request.userPrincipal.name}">
					<a class="talkmenu" href="j_spring_security_logout">로그아웃</a>				
					</c:if>
					</li>
					<li><a class="talkmenu" href="/board/listPage?num=1">시크릿톡</a></li>
					<li><a class="talkmenu" href="#">비밀일기장</a></li>
				</ul>
			</nav>
		</div>
		<div class="pic">
			<img src="images/시크릿톡.png" />
		</div>
	</div>
</body>
</html>