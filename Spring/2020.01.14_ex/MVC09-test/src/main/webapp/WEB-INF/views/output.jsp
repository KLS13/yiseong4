<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
</head>
<body>
	<form action="calc">
	
		첫 번째 수 : ${calculator.n1 } <br>
		두 번째 수 : ${calculator.n2 } <br>
		
		${calculator.n1 } ${calculator.nowOp } ${calculator.n2 } = ${calculator.result } <br>
		
		<input type="hidden" name="n1" value="${calculator.n1 }" />
		<input type="hidden" name="n2" value="${calculator.n2 }" />
		<input type="hidden" name="btn" value="${calculator.btn }" />
		<input type="submit" value="${calculator.btn }" />

	</form>
</body>
</html>