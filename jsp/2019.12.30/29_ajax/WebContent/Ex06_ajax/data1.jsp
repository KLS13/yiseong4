<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jQuery.ajax</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"data1.js",
			dataType: "script",
			type : "GET",
			success : function() {
				alert("성공");
				hi("안녕하세요");
			},
			error : function() {
				alert("에러");
			}
		});	
	});
</script>
</head>
<body>

</body>
</html>