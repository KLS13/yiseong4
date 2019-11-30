<%@page import="java.io.FileReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>application</title>
</head>
<body>
	<%
		// String filePath = application.getRealPath("JSP-수업내용.txt");
	%>
	<div>
		<%-- jsp_개요.txt 경로 : <%=filePath %> --%>
	</div>
	
	<br /><hr /><br />
	
	
	<h1>jsp_개요.txt 파일 읽기</h1>
	<%
		BufferedReader reader = null;
		try {
			String filePath = application.getRealPath("jsp_개요.txt");
			reader = new BufferedReader(new FileReader(filePath));
			while (true) {
				String message = reader.readLine();		// 한 줄 읽어 들이기
				if ( message == null ) {
					break;
				}
				out.print(message + "<br />");
			}
		} catch (FileNotFoundException e) {
			out.println("파일이 존재하지 않습니다.");
		} catch (IOException e) {
			out.println("파일을 읽을 수 없습니다.");
		} finally {
			try {
				if ( reader != null ) {
					reader.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	%>
	
</body>
</html>