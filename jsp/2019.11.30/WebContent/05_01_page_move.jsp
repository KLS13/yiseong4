<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동</title>
</head>
<body>
	<h1>페이지 이동의 시작페이지 입니다.</h1>
	<form action="/03_jsp/05_02_page_move.jsp">
		<div>이름<input type="text" name="name" /></div>
		<div>나이<input type="text" name="age" /></div>
		<div>
			<input type="submit" value="보내기" />
			<input type="reset" value="다시 작성" />
		</div>
	</form>
</body>
</html>