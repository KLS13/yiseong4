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
	color : purple;
	margin-top : 50px;
	}
	
	th {
	padding : 10px;
	}
	td {
	padding: 15px;
	}
</style>
<script type="text/javascript">

	function joinLogic ( f ) {
		if(f.writer.value == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		if(f.pw.value == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}

		f.action="join_Logic.jsp";
		f.submit();
	}
</script>
</head>
<body>
<h1 align = center> 회 원 가 입 하 기 </h1>
	<form method="post">
		<table border="1" align = center>
			<tr>
				<th> 사용할 작성자 아이디 </th>
			</tr>	
			<tr>
				<th> <input type="text" name="writer"/> </th>
			<tr/>
			<tr>
				<th> 사용할 비밀번호 </th>
			</tr>	
			<tr>
				<th> <input type="text" name="pw"/> </th>
			<tr/>
			<tr>
				<th> 회원가입을 동의하십니까? 
					<input type="radio" name="agree" value="동의" />
				</th>
			</tr>	
			<tr>
				<th> <input type="button" value="회원가입" onclick="joinLogic(this.form)"/> </th>
			<tr/>
		</table>
	</form>
</body>
</html>