<%@ page language="java" contentType="text/html; charset=utf-8" 
	pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}.</P>

<!-- 이미지 -->
<p>
<img alt="google이미지" src="/mvc02/resources/google.jpg" />
</p>
<hr>
<p>
<img alt="google이미지" src="/mvc02/myResources/google.jpg" />
</p>
</body>
</html>
