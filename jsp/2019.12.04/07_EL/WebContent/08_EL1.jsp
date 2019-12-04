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
		String[] hobbies = {"독서", "명상", "요가"};	
		request.setAttribute("HOBBIES", hobbies);
	%>
	<jsp:forward page="08_EL2.jsp"></jsp:forward>
	
	
	
		
	
</body>
</html>