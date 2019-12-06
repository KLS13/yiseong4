<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 운동선수</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		session.setAttribute("entertainer", request.getParameter("entertainer"));
	%>

	<h1>좋아하는 운동선수는 누구인가요?</h1>
	<form action="session_test9.jsp">
		<input type="text" name="player" /> <br /><br />
		<input type="submit" value="전달" />
	</form>
	
</body>
</html>








