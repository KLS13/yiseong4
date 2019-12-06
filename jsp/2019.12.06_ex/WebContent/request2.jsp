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
		String entertainer = request.getParameter("entertainer");
	%>

	<h1>좋아하는 운동선수는 누구인가요?</h1>
	<form action="request3.jsp">
		<input type="text" name="player" /> <br /><br />
		<input type="hidden" name="entertainer" value="<%=entertainer %>" />
		<input type="submit" value="전달" />
	</form>
	
</body>
</html>