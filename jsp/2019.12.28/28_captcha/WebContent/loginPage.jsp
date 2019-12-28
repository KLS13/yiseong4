<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<div>
		<form action="/28_captcha/check.do">
			메시지 입력 <input type="text" name="input" required /> <br />
			<img src="upload/${tempname}" alt="캡챠이미지" />
			<input type="button" value="새로 고침" onclick="location.href='/28_captcha/getImage.do'" />
			<br /><br />
			<input type="submit" value="전송" />
		</form>
	</div>
</body>
</html>