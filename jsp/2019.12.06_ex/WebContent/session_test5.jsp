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
	String name1 = request.getParameter("name1"); 
	
	session.setAttribute("name1", name1);
%>
	<form action="session_test6.jsp">
	운동선수 <input type="text" name="name2"/>
	<br /><br />
	<input type="submit" value="전송">
	</form>
	
	
	
	

</body>
</html>