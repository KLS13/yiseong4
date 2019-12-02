<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="/2019.12.01/forward_02.jsp">
		<% if ( request.getParameter("num1") == null && request.getParameter("num2") == null ) { %>
			첫 번째 수 : <input type="text" name="num1" /><br />
			두 번재 수 : <input type="text" name="num2" /><br />
		<% } else { %>
			첫 번째 수 : <input type="text" name="num1" value="<%=request.getParameter("num1") %>" /><br />
			두 번재 수 : <input type="text" name="num2" value="<%=request.getParameter("num2") %>" /><br />
		<% } %>
		<input type="submit" value="입력" />
	</form>
	
</body>
</html>
