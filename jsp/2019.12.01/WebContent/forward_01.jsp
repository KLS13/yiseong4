<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function forward(){
		location.href = "/03_jsp/Test/forward_02.jsp";
	}
</script>
</head>
<body>
	<div>첫번째 수 : <input type="text" name="num1"></div>
	<div>두번째 수 : <input type="text" name="num2"></div>
	<input type="button" value="입력" onclick="forward()" />
	
</body>
</html>