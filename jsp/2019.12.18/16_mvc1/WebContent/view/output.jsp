<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 요청 결과</title>
</head>
<body>
	<div>
		<h1>현재 날짜(표현식) : <%= request.getAttribute("today") %> </h1>
		<h1>현재 날짜(EL) : ${today}</h1>
		<hr />
		<h1>현재 시간(표현식) : <%= request.getAttribute("time") %></h1>
		<h1>현재 시간(EL) : ${time }</h1>
	</div>
</body>
</html>