<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시판</title>
<script type="text/javascript">
	function start() {
		setTimeout(function() {
			location.href = "/25_mvc_bbs/list.do";
		}, 3000);
	}
</script>
</head>
<body onload="start()">
	<h1> 3초후 bbs 게시판 이동</h1>
</body>
</html>
