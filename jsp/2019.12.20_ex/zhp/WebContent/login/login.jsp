<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

	function login ( f ) {
		
		var id= f.id.value;
		var pw= f.pw.value;
		
		if(id == "admin") {
			alert("관리자 입니다.");
		}
		if(id == "") {
			alert("아이디를 입력해주세요");
			return;
		}
		if(pw == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		location.href="/zhp/HpAction?id="+id+"&pw="+pw;
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
				<td> <input type="password" name="pw" /></td>
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