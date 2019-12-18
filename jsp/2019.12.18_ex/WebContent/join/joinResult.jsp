<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
	<form action="/2019.12.18_ex/login/login.jsp">
		<h1> 회원가입을 완료하였습니다.</h1>
		<table>
			<tr>
				<th> 아이디 </th>
				<td> ${sessionScope.id } </td>
			</tr>
			<tr>
				<th> 이름 </th>
				<td> ${sessionScope.name } </td>
			</tr>
			<tr>
				<th> 이메일 </th>
				<td> ${sessionScope.email } </td>
			</tr>
			<tr>
				<th> 동의여부 </th>
				<td> ${sessionScope.agree} 완료  </td>
			</tr>
			<tr>
				<th colspan="2"> <input type="submit" value="로그인 하러가기"> </th>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>