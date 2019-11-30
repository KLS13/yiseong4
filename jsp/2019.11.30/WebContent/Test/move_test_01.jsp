<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이동하고자 하는 사이트명을 선택하시오.
	
	<form name="myForm" action="/03_jsp/test/move_test_02.jsp">
	사이트명 : <select name=option>
			<option value="google">google</option>
			<option value="naver">naver</option>
			<option value="daum">daum</option>
			</select>
			<input type="submit" value = "확인" >
	</form>
</body>
</html>