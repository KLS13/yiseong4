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
	request.setCharacterEncoding("utf-8");
	int age = Integer.parseInt(request.getParameter("age"));
	
	if(age <= 19) {
		//포워드 : request 를 그대로 이동
		RequestDispatcher dispatcher = request.getRequestDispatcher("responseAge_03.jsp");
		dispatcher.forward(request, response);
		// but 리다이렉트는 request 를 이동시켜주지 않으므로 parameter 를 붙여서 이동해야한다.
		/* response.sendRedirect("/03_jps/Test/responseAge_03.jsp?age=" + age); */
	}else {
		request.getRequestDispatcher("responseAge_04.jsp").forward(request, response);
		/* 리다이렉트
			response.sendRedirect("/03_jps/Test/responseAge_04.jsp?age=" + age); 
		*/
	}

%>
</body>
</html>