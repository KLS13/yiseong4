<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 만들기</title>
</head>
<body>

	<%
		//쿠키 만들기
		//Cookie cookie = new Cookie("쿠키이름","쿠키값"); // String 쿠키이름 = "쿠키값"
		Cookie cookie = new Cookie("id","admin");	// String id = "admin"
		cookie.setMaxAge(24 * 60 * 60); // 24*60*60  쿠키 유효시간 : 1일
		//쿠키값에 공백,콤마,괄호 등을 저장하려면 
		//쿠키 저장하기( 쿠키저장소에 저장하기 )
		Cookie bisket = new Cookie("name", URLEncoder.encode("제임스 본드", "utf-8"));
		response.addCookie(cookie);
		response.addCookie(bisket);
		bisket.setMaxAge(20 * 60);  // 20* 60  쿠키 유효시간 : 20분
	%>
	<h1>
		쿠키이름1 : <%= cookie.getName() %> <br /> 
		쿠키값1 :	<%=cookie.getValue() %> <br />
	 
	 	쿠키이름2 : <%= bisket.getName() %> <br />
		쿠키값2 : <%= URLDecoder.decode(bisket.getValue(), "utf-8") %> <br />
	</h1>

</body>
</html>