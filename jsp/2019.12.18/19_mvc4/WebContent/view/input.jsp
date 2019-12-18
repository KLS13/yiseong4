<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 페이지</title>
<script type="text/javascript">
	function send1() {
		location.href="/19_mvc4/hangle.do";
	}
	function send2() {
		location.href="/19_mvc4/english.do";
	}
</script>
</head>
<body>
	<div>
		<input type="button" value="안녕" onclick="send1()" /><br /><br />
		<input type="button" value="hello" onclick="send2()" /> <br /><br />
	</div>
</body>
</html>