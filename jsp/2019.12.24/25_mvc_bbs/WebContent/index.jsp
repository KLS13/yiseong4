<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시판</title>
<script type="text/javascript">
	function start() {
		setTimeout( function() {
			location.href = "/25_mvc_bbs/list.do";
		}, 1000);
	}
</script>
</head>
<body onload="start()">
	<h3>1초 후에 BBS 게시판으로 이동합니다.</h3>
</body>
</html>