<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function login ( f ) {
		if(f.id.value == "admin") {
			alert("관리자 입니다.");
		}
		f.action = "/2019.12.18_ex/Controller?num=2";
		f.submit();
	}
</script>
</head>
<body>
	<form>
		
		<table>
			<tr>
				<th> 아이디 </th>
				<td> <input type="text" name="id" />
			</td>
			<tr>
				<th> 비밀번호 </th>
				<td> <input type="text" name="pw" /></td>
			</tr>
			<tr>
				<th colspan="2">
				<input type="button" value="로그인" onclick="login(this.form)"/>
				</th>
			</tr>
		</table>
		
	</form>
</body>
</html>