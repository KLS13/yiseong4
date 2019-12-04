<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>컬렉션 사용하기</title>
</head>
<body>
	<%
		// 좋아하는 국내 여행지 3곳을 ArrayList 에 담아서 
		List<String> list = new ArrayList<String>(3);
	
		list.add("평창");
		list.add("제주도");
		list.add("부산");
		
		request.setAttribute("LIST", list);
	%>
		<jsp:forward page="09_EL2.jsp"></jsp:forward>
		
	
	
</body>
</html>