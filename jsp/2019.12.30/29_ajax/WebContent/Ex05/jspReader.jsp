<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 파일 로드하기</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	// 페이지 로드 이벤트
	$(function(){
		$("#btn").click(function(){
			$("#content").load("jsp_data.jsp");
		});
	}); 
</script>
</head>
<body>
	<form>
		<input type="button" value="가져오기" id="btn" /> <br /><br />
	</form>
	<div>
		<h1 style="color:red;">jspReader.jsp 입니다.</h1>
		<div id="content"></div>
	</div>
</body>
</html>