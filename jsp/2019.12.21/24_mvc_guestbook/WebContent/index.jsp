<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작 페이지</title>
<script type="text/javascript">
	function start() {
		setTimeout(function(){
			location.href = "/24_mvc_guestbook/list.do";	// 전체 방명록을 보여준다.
		}, 5000);
	}
</script>
</head>
<body onload="start()">
	<h3>5초 후에 방명록으로 이동합니다.</h3>
	<%--
		Model 		: com.koreait.guestbook.model 패키지에 자바로 작성
		View 		: WebContent/guestbook 폴더에 JSP로 작성
					  index.jsp 는 WebContent 아래에 있음
		Controller 	: com.koreait.controller 패키지에 Servlet으로 작성
					  URL Mapping 값은 "*.do"로 설정되어 있음
	--%>
</body>
</html>