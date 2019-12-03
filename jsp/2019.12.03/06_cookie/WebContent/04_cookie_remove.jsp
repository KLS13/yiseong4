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
	<!-- 쿠키 삭제는 기존 쿠키가 같은 이름의 쿠키를 새로 만들고, 유효시간은 0 으로 설정. -->
	<% 
		Cookie[] cookieBox = request.getCookies();
		if ( cookieBox != null && cookieBox.length > 0 ) {
			for ( Cookie cookie : cookieBox ) {
				if ( cookie.getName().equals("name") ) {
					Cookie bisket = new Cookie("name", "");
					bisket.setMaxAge(0);
					response.addCookie(bisket);
				}
			}
		} else {
			out.print("존재하는 쿠키가 없습니다.");
		}
		
%>
</body>
</html>