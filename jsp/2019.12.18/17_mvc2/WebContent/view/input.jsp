<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function two() {
		location.href="/17_mvc2/GugudanController?cmd=two";
	}
	
	function three() {
		location.href="/17_mvc2/GugudanController?cmd=three";
	}
</script>
</head>
<body>
	<div>
		<form>
			<input type="button" value="2단" onclick="two()" /> <br />
			<input type="button" value="3단" onclick="three()" /> <br />
		</form>
	</div>
</body>
</html>