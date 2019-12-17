<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;	
	}
</style>
<script type="text/javascript">
	function login(f) {
		if(f.writer.value == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		if(f.pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		f.action = "loginLogic.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post" action="/2019.12.17_ex/join/join.jsp">
		<table border="1" align = center>
				<tr>
					<th> 아이디 </th>
					<td><input type="text" name="writer" placeholder="아이디를 입력하세요"/></td>
				</tr>
				<tr>
					<th> 비밀번호 </th>
					<td><input type="password" name="pw" placeholder="비밀번호를 입력하세요"/></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="button" value="로그인" onclick="login(this.form)"/>
						<input type="submit" value="회원가입"/>
					</th>
				</tr>
		</table>
	</form>
</body>
</html>