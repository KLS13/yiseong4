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
		if( session.getAttribute("isAdmin")!=null) {
			if(session.getAttribute("isAdmin").equals("yes")){
				response.sendRedirect("session_test3.jsp");	
			}else{
				session.invalidate();  // 세션초기화 ( 세션에 저장된 정보 모두 초기화 )	
			}
		}
	%>

	<form method="post" action="session_test2.jsp">
		아이디 <input type="text" name="id" /> <br /><br />
		패스워드 <input type="password" name="pw" /> <br /> <br />
		<input type="submit" value="로그인" />
		<input type="reset" value="다시 시도" />
	</form>
</body>
</html>