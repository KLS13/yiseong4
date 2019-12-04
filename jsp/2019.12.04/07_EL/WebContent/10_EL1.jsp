<%@page import="bean.StudentDto"%>
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
		StudentDto bean = new StudentDto();
		
		bean.setNo("10101");
		bean.setName("앨리스");
		bean.setDept("항소");
		bean.setAge(30);
		
		request.setAttribute("BEAN", bean);
	%>
		<jsp:forward page="10_EL2.jsp"></jsp:forward>
</body>
</html>