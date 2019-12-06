<%@page import="java.io.IOException"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>

	<%
		String result = request.getParameter("result");
	
		if( result.equals("success")) {
			out.println("<h1>가입되었습니다.</h1>");
			out.println("<h3>가입 내용</h3>");
			
			// 저장된 id.txt 파일 읽기
			BufferedReader reader = null;
			String id = (String)session.getAttribute("ID");
			try {
				String filePath = application.getRealPath("/" + id + ".txt");
				reader = new BufferedReader(new FileReader(filePath));
				String message = null;
				while(true) {
					message = reader.readLine(); // 한줄 읽어들이기
					if(message == null) {
						break;
					}
					out.println(message + "<br />");
				}
			}catch(FileNotFoundException e) {
				out.println("파일이 없습니다.");
			}catch(IOException e) {
				out.println("파일을 못 읽었습니다.");
			}finally {
				try{
				if(reader != null) 
					{reader.close();}
				}catch(Exception e) {}
			}
		}else{
			out.println("가입되지 않았습니다.");
		}
		session.invalidate();
	%>
</body>
</html>