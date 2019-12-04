<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 음식</title>
</head>
<body>
	
	아이디 : ${param.id} <br />
	좋아하는 음식 : <br />
	${paramValues.favorites[0] } <br />
	${paramValues.favorites[1] } <br />
	${paramValues.favorites[2] } <br />
	${paramValues.favorites[3] } <br />
	${paramValues.favorites[4] }	
</body>
</html>