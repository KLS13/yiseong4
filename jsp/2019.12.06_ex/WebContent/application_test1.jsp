<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
	<h1>신규 회원 정보</h1>
	<form action="application_test2.jsp" method="post">
		아이디 <input type="text" name="id" /> <br /><br />
		패스워드 <input type="password" name="pw" /> <br /><br />
		이름 <input type="text" name="name" /> <br /><br />
		<input type="submit" value="회원가입" />
	</form>
</body>
</html>