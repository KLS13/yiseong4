<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정보 요청 페이지</title>
<script type="text/javascript">

/* 
	JSP는 Controller ( Servlet ) 에게 요청.
	
	Servlet 호출 방법
	1. /프로젝트명/서블릿명
	2. /프로젝트명/URL매핑
*/
	function req_date() {
		location.href = "/16_mvc1/Controller1";
	}
	
	function req_time() {
		location.href = "/16_mvc1/Controller2";
	}
</script>

</head>
<body>
	<div>
		<h1>원하는 정보의 버튼을 클릭하세요</h1>
		<form>
			<input type="button" value="현재 날짜 요청" onclick= "req_date()" /> <br />
			<input type="button" value="지금 시간 요청" onclick= "req_time()" />
		</form>
	</div>
</body>
</html>