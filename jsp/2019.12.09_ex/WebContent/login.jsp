<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="loginLogic.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="user_id"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="user_password"></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="로그인" />
				</th>
		</table>
	</form>
</body>
</html>