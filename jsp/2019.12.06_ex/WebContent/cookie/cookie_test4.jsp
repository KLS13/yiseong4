<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	String marry = request.getParameter("marry");
	String job = request.getParameter("job");
	
	response.addCookie( new Cookie("YEAR", URLEncoder.encode(year,"utf-8")));
	response.addCookie( new Cookie("MONTH",URLEncoder.encode(month,"utf-8")));
	response.addCookie( new Cookie("DAY",URLEncoder.encode(day,"utf-8")));
	response.addCookie( new Cookie("MARRY",URLEncoder.encode(marry,"utf-8")));
	response.addCookie( new Cookie("JOB",URLEncoder.encode(job,"utf-8")));
	
	response.sendRedirect("cookie_test5.jsp");
	%>
	

</body>
</html>