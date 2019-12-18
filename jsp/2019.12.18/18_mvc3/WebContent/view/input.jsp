<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 요청</title>
<script type="text/javascript">
	function fruit() { 
		location.href="/18_mvc3/Controller?cmd=1";
	}
	
	function vegetable() { 
		location.href="/18_mvc3/Controller?cmd=2";
	}
</script>
</head>
<body>
	<div>
		<form action="">
			<input type="button" value="과일" onclick="fruit()"/> <br /><br />
			<input type="button" value="야채" onclick="vegetable()"/>
		</form>
	</div>
</body>
</html>