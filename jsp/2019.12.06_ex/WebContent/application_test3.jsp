<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String agree = request.getParameter("agree");
	String result = null;
	
	if(agree.equals("yes")) {
		String id = (String)session.getAttribute("ID");
		String pw = (String)session.getAttribute("PW");
		String name = (String)session.getAttribute("NAME");
		PrintWriter writer = null;
		try {
			String filePath = application.getRealPath("/" + id + ".txt");
			writer = new PrintWriter(filePath);
			writer.println("가입 아이디 : " + id);
			writer.println("가입 패스워드 : " + pw);
			writer.println("가입 이름 : " + name);
			result = "success";
		}catch(IOException e) {
			result = "fail";
		}finally{
			try{
				if(writer != null ) {writer.close(); }
			}catch(Exception e) { }
		}
	}else {
		result = "fail";
	}
	
	response.sendRedirect("application_test4.jsp?result=" + result);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>