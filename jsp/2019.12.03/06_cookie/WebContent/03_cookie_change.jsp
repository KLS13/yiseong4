<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 쿠키 값 변경은 덮어쓰기다. -->
	<% 
		Cookie[] cookieBox = request.getCookies();
		if( cookieBox != null && cookieBox.length >0) {
			for(int i=0; i<cookieBox.length; i++) {
				if(cookieBox[i].getName().equals("name")) {
					Cookie cookie = new Cookie("name",URLEncoder.encode("홍 길동", "utf-8"));
					cookie.setMaxAge(15*24*60*60);   //쿠키 유효시간 : 15일
					response.addCookie(cookie);
				}
			}
		}
	%>
</body>
</html>