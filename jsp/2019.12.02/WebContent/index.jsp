<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>
<style type="text/css">
	div {
		width: 600px;
		margin: auto;
	}
	table {
		font-size: 1.2em;
		border-collapse: collapse;
		width: 100%;
	}
	td, th {
		padding: 3px 5px;
		border: 1px solid black;
	}
	input {
		font-size: 1.2em;
	}
	input[type=text], input[type=password], input[type=number] {
		width: 300px;
	}
</style>
<script type="text/javascript">
	// 1. 전체검색
	function view_all() {
		location.href = "/04_DB_02/view_all.jsp";
	}
	// 2. 검색(by id)
	function view_one( f ) {
		if ( f.id.value == "" ) {
			alert("아이디를 입력한 뒤 검색하세요.");
			f.id.focus();
			return;
		}
		f.action = "/04_DB_02/view_one.jsp";
		f.submit();
	}
	// 3. 삽입
	function insert_one( f ) {
		if ( f.id.value == "" ||
			 f.pw.value == "" ||
			 f.name.value == "" || 
			 f.age.value == "" ||
			 f.addr.value == "" ) {
			alert("모든 정보를 입력한 뒤 삽입하세요.");
			return;
		}
		f.action = "/04_DB_02/insert_one.jsp";
		f.submit();
	}
	// 4. 삭제
	function remove_one( f ) {
		if ( f.id.value == "" || f.pw.value == "" ) {
			alert("아이디와 비밀번호를 모두 입력한 뒤 삭제하세요.");
			return;
		}
		f.action = "/04_DB_02/remove_one.jsp";
		f.submit();
	}
	// 5. 수정
	function update_one( f ) {
		if ( f.id.value == "" || f.pw.value == "" ) {
			alert("아이디와 비밀번호를 모두 입력한 뒤 수정하세요.");
			return;
		}
		f.action = "/04_DB_02/update_one.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th colspan="2">회원 정보 관리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" autocomplete="off" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" /></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" autocomplete="off" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" name="age" autocomplete="off" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr" autocomplete="off" /></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<input type="button" value="전체검색" onclick="view_all()" />&nbsp;&nbsp;
							<input type="button" value="검색" onclick="view_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="삽입" onclick="insert_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="remove_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="수정" onclick="update_one(this.form)" />&nbsp;&nbsp;
							<input type="reset" value="다시작성" />
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>