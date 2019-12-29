<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	${loginDto.mId }(${loginDto.mName})님 반갑습니다.
	
	<h1>구매하는 곳 입니다.</h1>
	보유 포인트 : ${loginDto.mPoint }점 입니다. <br />
	사용 가능 포인트 :  ${loginDto.mPoint }
</body>
</html>