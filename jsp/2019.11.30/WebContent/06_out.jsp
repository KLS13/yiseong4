<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 1~10 사이의 모든 정수 출력하기</h1>
	<% for (int i = 1; i<=10; i++ ) { %>
		<%= i %> <br />
	<% } %>

	<br /><hr />
	
	<h1> 1~10 사이의 모든 정수 출력하기</h1>
	<%
		for(int i=1; i<=10; i++) {
			out.print(i + "<br />");
			// out.println(i);
		}
	%>
</body>
</html>