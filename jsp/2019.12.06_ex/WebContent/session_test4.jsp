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
		String name1 = (String)session.getAttribute("name1");
		String name2 = (String)session.getAttribute("name2");
		if( name1 !=null && name2!=null) {
			out.print("좋아하는 연예인 : " + name1 + "<br />");
			out.print("좋아하는 선수 : " + name2);
			}else{
	%>
	
	<form action="session_test5.jsp">
	연예인 <input type="text" name="name1"/> <br /><br />
	
	<input type="submit" value="전송">
	</form>
	<%
		}
	%>
	
	
</body>
</html>