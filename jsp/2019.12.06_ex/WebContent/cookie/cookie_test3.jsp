<%@page import="java.net.URLEncoder"%>
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

	String addr = request.getParameter("addr");
	String tel = request.getParameter("tel");
	String email = request.getParameter("email");
	
	response.addCookie( new Cookie("ADDR",URLEncoder.encode(addr,"utf-8")));
	response.addCookie( new Cookie("TEL",URLEncoder.encode(tel,"utf-8")));
	response.addCookie( new Cookie("EMAIL",URLEncoder.encode(email,"utf-8")));
%>
	<form action="cookie_test4.jsp" >
		<table>
			<tr>
				<td>생년월일 : </td>
				<td><input type="text" name="year"/>년 <input type="text" name="month"/>월 
				<input type="text" name="day"/>일
				</td>
			</tr>
			<tr>
				<td>결혼여부 : </td>
				<td><input type="radio" name="marry" value="미혼"/>미혼
					<input type="radio" name="marry" value="기혼"/>기혼
				</td>
			</tr>
			<tr>
				<td>직업 : </td>
				<td>
					<select name="job">
						<option>회사원</option>
						<option>공무원</option>
						<option>자영업</option>
					</select>
				</td>
			</tr>
		</table>
		<br />
		<br />
		<input type="submit" value="확인">
	</form>
	
</body>
</html>