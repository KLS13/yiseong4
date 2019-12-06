<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		session.setAttribute("ID", request.getParameter("id"));
		session.setAttribute("PW", request.getParameter("pw"));
		session.setAttribute("NAME", request.getParameter("name"));
		
	%>

	<h1>이용 약관</h1>
	----------------------------------------------<br />
	1. 회원 정보는 웹 사이트 운영을 위해서만 사용됩니다. <br />
	2. 회원 정보는 제공을 원치 않으면 정보 제공을 하지 않을 수 있습니다. <br />
	3. 다만 이 경우 정상적인 웹 사이트 이용이 제한됩니다.
	----------------------------------------------<br /><br />
	
	<form action="application_test3.jsp" method="post" >
	위 약관에 동의합니까? <br /><br />
	<input type="radio" name="agree" value="yes" /> 동의 함 &nbsp;&nbsp;
	<input type="radio" name="agree" value="no" /> 동의 안함 <br /><br />
	<input type="submit" value="회원가입" />	
	</form>
</body>
</html>