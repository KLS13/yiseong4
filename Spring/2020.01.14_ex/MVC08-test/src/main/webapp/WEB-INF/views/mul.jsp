<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="div">
		첫 번째 수 : ${n1 } <br>
		두 번째 수 : ${n2 } <br>
		${n1 } * ${n2 } = ${n1*n2 } <br>
		<input type="submit" value="나눗셈" />
		<input type="hidden" name="n1" value="${n1 }" />
		<input type="hidden" name="n2" value="${n2 }" />
	</form>
</body>
</html>