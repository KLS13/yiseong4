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
	
	<form>
	<div>
		<div class="coffee1">
		<h1>커피1</h1>
		<input type="button" value="교환하기" name="item" onclick="location.href='/26_mvc_member/buy.do?item=coffee1&price=100'">
		</div>
		<div class="coffee2">
		<h1>커피2</h1>
		<input type="button" value="교환하기" name="item" onclick="location.href='/26_mvc_member/buy.do?item=coffee2&price=120'">
		</div>
		<div class="coffee3">
		<h1>커피3</h1>
		<input type="button" value="교환하기" name="item" onclick="location.href='/26_mvc_member/buy.do?item=coffee3&price=135'">
		</div>
	</div>
	</form>
</body>
</html>