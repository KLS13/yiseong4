<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<style type="text/css">
	div { 
		width: 500px;
		margin: auto;
	}
	table {
		width: 500px;
		border-collapse: collapse;
	}
	td {
		border: 1px solid black;
		padding: 10px;
	}
	td:nth-child(1) {
		width: 150px;
	}
	td:nth-child(2) {
		width: 350px;
	}
</style>
<script type="text/javascript">
	function insert_go(f) {
		if (f.id.value == "") {
			alert("아이디 필수");
			f.id.focus();
			return;
		}
		if (f.pw.value == "") {
			alert("비밀번호 필수");
			f.pw.focus();
			return;
		} else if (f.pw.value != f.pw2.value) {
			alert("두 비밀번호가 달라");
			f.pw.value="";
			f.pw2.value="";
			f.pw.focus();
			return;
		}
		if (f.name.value == "") {
			alert("이름 필수");
			f.name.focus();
			return;
		}
		if (f.addr.value == "") {
			alert("주소 선택");
			return;
		}
		f.action = "join.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h1 style="text-align: center;">회원 가입 페이지</h1>
		<form method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="id" autofocus />
						<input type="button" value="중복확인" />
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="pw2" /></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name="addr">
							<option value="">::선택::</option>
							<option value="서울">서울</option>
							<option value="경기">경기</option>
							<option value="인천">인천</option>
							<option value="부산">부산</option>
							<option value="제주">제주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
						<input type="button" value="가입" onclick="insert_go(this.form)" />&nbsp;&nbsp;
						<input type="reset" value="취소" />&nbsp;&nbsp;
						<input type="button" value="로그인 하러 가기" onclick="location.href='loginPage.jsp'" />
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>