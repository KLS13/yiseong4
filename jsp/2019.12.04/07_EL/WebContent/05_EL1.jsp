<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 음식</title>
</head>
<body>
	<form action="05_EL2.jsp">
	
		<h1>회원님의 좋아하는 음식을 알려주세요.</h1>
		아이디 : <input type="text" name="id" /> <br /><br /> 
		<input type="checkbox" name = "favorites" value="사과"> 사과 
		<input type="checkbox" name = "favorites" value="딸기"> 딸기
		<input type="checkbox" name = "favorites" value="망고"> 망고
		<input type="checkbox" name = "favorites" value="포도"> 포도
		<input type="checkbox" name = "favorites" value="수박"> 수박
		
		<br />
		<br />

		<input type="submit" value="전송" />
		<input type="reset" value="취소" />
	</form>
</body>
</html>