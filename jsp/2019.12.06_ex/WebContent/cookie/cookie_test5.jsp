<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<%
		Cookie[] cookieBox = request.getCookies();	
	%>
	<%!
		// 메소드 정의 : 선언부
		private String getCookieValue(Cookie[] cookieBox, String cookieName) {
		
			if ( cookieBox == null ) {
				return null;
			}
			try {
				for ( Cookie cookie : cookieBox ) {
					if ( cookie.getName().equals(cookieName) ) {
						return URLDecoder.decode(cookie.getValue(), "utf-8");
					}
				}
			} catch (Exception e) {
				return null;
			}
			return null;
			
		}
	%>


	<h3> 가입 내용 </h3>
	
	아이디 : <%= getCookieValue(cookieBox,"ID") %><br />
	패스워드 : <%= getCookieValue(cookieBox,"PW") %><br />
	성명 : <%= getCookieValue(cookieBox,"NAME") %><br />
	주소 : <%= getCookieValue(cookieBox,"ADDR") %><br />
	전화번호 : <%= getCookieValue(cookieBox,"TEL") %><br />
	이메일 : <%= getCookieValue(cookieBox,"EMAIL") %><br />
	생년월일 : <%= getCookieValue(cookieBox,"YEAR") %>년
			<%= getCookieValue(cookieBox,"MONTH") %>월
			<%= getCookieValue(cookieBox,"DAY") %>일<br />
	결혼여부 : <%= getCookieValue(cookieBox,"MARRY") %><br />
	직업 : <%= getCookieValue(cookieBox,"JOB") %><br />
	
	<br />
	<h1>위 내용으로 가입 완료</h1>
	
</body>
</html>