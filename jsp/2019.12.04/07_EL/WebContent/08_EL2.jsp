<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request 의  attribute 로 저장된 HOBBIES </h1>
	<ul>
		<li>${HOBBIES[0]}</li>
		<li>${HOBBIES[1]}</li>
		<li>${HOBBIES[2]}</li>
	</ul>
	<h1> request의 parameter 로 저장되지 않은 HOBBIES </h1>
	<ul>
		<li>${paramValues.HOBBIES[0]}</li> <!-- set.attribute 에 담았기때문에 파라미터x  -->
	</ul>
</body>
</html>