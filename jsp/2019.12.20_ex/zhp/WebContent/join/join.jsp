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
		var id = f.id.value;
		var pw = f.pw.value;
		var name = f.name.value;
		var agree = f.agree.value;
		
		if( id == "") {
			alert("아이디를 입력해주세요.");
			return;
		}
		if( pw == "") {
			alert("비밀번호를 입력해주세요.");
			return;
		}

		if( name == "") {
			alert("이름을 입력해주세요.");
			return;
		}
		if( agree != "동의") {
			alert("입력란에 동의를 적어주세요.");
			return;
		}
		location.href= "/zhp/HpAction2?id="+id+"&pw="+pw+"&name="+name+"&agree="+agree;

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
				<th> <input type="text" name="id"/> </th>
			<tr/>
			<tr>
				<th> 사용할 비밀번호 </th>
			</tr>	
			<tr>
				<th> <input type="text" name="pw"/> </th>
			<tr/>
			<tr>
				<th> 사용자 이름 </th>
			</tr>	
			<tr>
				<th> <input type="text" name="name"/> </th>
			<tr/>
			<tr>
				<th> 회원가입을 동의하십니까?<br />
					 동의하신다면 "동의"라고 적어주세요. 
				</th>
			</tr>	
			<tr>
				<th> <input type="text" name="agree" placeholder="동의" />
			</tr>
			<tr>
				<th> <input type="button" value="회원가입" onclick="joinLogic(this.form)"/> </th>
			<tr/>
		</table>
	</form>
</body>
</html>