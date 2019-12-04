<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 쿠키에 이름 올리기 --%>
	<% 
		Cookie cookie = new Cookie("name","KLS");
		cookie.setMaxAge(10*60); // 쿠키 유효시간	
		response.addCookie(cookie);
	%>
	
	쿠키가 생성되었습니다.
	
</body>
</html>