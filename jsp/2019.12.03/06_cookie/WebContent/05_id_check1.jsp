<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 기억하기</title>
</head>
<body>

	<%
		// "save_id" 쿠키 확인
		Cookie[] cookieBox = request.getCookies();
		String id = null;
		
		if ( cookieBox != null && cookieBox.length > 0 ) {
			for ( int i = 0; i < cookieBox.length; i++ ) {
				if ( cookieBox[i].getName().equals("save_id") ) {
					id = cookieBox[i].getValue();
					break;
				}
			}
		}
	%>
	<form action="05_id_check2.jsp">
		<% if ( id == null ) { %>
			아이디 <input type="text" name="id" /> <br />
		<% } else { %>
			아이디 <input type="text" name="id" value="<%=id %>" /> <br />
		<% } %>
		
		<br />
		<input type="checkbox" name="save_id" /> 아이디 기억하기
		
		<br />
		<input type="submit" value="전송" />
	
	</form>
	
</body>
</html>