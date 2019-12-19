<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
</style>
</head>
<body>
	<form>
		<div>
			<table border="1">
				<tr>
					<th>로그인 하러가기<th>
					<td><input type="button" value="로그인" onclick="location.href='/zhp/login/login.jsp'"></td>
				</tr>
				<tr>
					<th>회원가입 하러가기<th>
					<td><input type="button" value="회원가입" onclick="location.href='/zhp/join/join.jsp'"></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>