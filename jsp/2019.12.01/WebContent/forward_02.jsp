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
	request.setCharacterEncoding("utf-8");
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	request.getRequestDispatcher("forward_03.jsp").forward(request, response);
	
%>
	<input type = hidden name="num1" value="<%=num1%>" />
	<input type = hidden name="num1" value="<%=num2%>" />

</body>
</html>