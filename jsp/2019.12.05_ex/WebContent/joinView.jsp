<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="joinLogic.jsp">
		<table>
			<tr> 
				<td> 아이디 </td>
				<td> <input type="text" name="id"/> </td>
			</tr>
			
			<tr>
				<td> 비밀번호 </td>
				<td> <input type="password" name="pw"/> </td>
			</tr>
			<tr>
				<td> 이메일 </td>
				<td> <input type="text" name="email" /> </td>
			</tr>
			<tr>
				<td> 닉네임 </td>
				<td> <input type="text" name="nick" /> </td>
			</tr>
		</table>
			<input type="submit" value="전송" />
	</form>
</body>
</html>
