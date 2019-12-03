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
	<%-- 쿠키저장소의 모든 데이터 확인하기 --%>
	<%
		Cookie[] cookieBox = request.getCookies();
		
		if(cookieBox != null && cookieBox.length > 0) {
			for(int i=0; i<cookieBox.length; i++) {
				out.print("쿠키이름: " + cookieBox[i].getName() + "<br />");
				out.print("쿠키값 : " + URLDecoder.decode(cookieBox[i].getValue(), "utf-8") + "<br />");
			}
		}else {
			out.print("쿠키가 존재하지 않습니다.");
		}
	%>
</body>
</html>