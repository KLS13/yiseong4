<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function login1(f) {
		// action 처리할 때 /(슬래시)로 시작하지 않는다.
		// f.action = "/member/result"; 이건 안 됩니다.
		f.action = "member/result"; // @RequestMapping("/member/result") 으로 이동한다.
		f.submit();
	}
	function login2(f) {
		f.action = "member/result";
		f.submit();
	}
</script>
</head>
<body>

	<!-- form method : GET / POST -->
	
	GET 방식 <br />
	<form method="GET">
		<div>아이디 <input type="text" name="id" /></div>
		<div>비밀번호 <input type="password" name="pw" /></div>
		<input type="button" value="로그인" onclick="login1(this.form)" />
	</form>
	
	<hr />
	
	POST 방식 <br />
	<form method="POST">
		<div>아이디 <input type="text" name="id" /></div>
		<div>비밀번호 <input type="password" name="pw" /></div>
		<input type="button" value="로그인" onclick="login2(this.form)" />
	</form>
	

</body>
</html>