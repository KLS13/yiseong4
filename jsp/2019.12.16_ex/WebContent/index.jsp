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
		text-align: center;
	}
	table {
		font-size: 1.1em;
		border-collapse: collapse;
		width: 700px;
	}
	td, th {
		padding: 5px;
		border: 1px solid black;
	}
	input[type=text], input[type=password], input[type=number] {
		width: 450px;
	}
</style>
<script type="text/javascript">
	// 1. 전체검색
	function view_all() {
		location.href = "view_all.jsp";
	}
	// 2. 검색(by id)
	function view( f ) {
		if ( f.id.value == "" ) {
			alert("아이디를 입력한 뒤 검색하세요.");
			f.id.focus();
			return;
		}
		f.action = "view.jsp";
		f.submit();
	}
	// 3. 삽입
	function insert( f ) {
		if ( f.id.value == "" ||
			 f.pw.value == "" ||
			 f.name.value == "" || 
			 f.age.value == "" ||
			 f.addr.value == "" ) {
			alert("모든 정보를 입력한 뒤 삽입하세요.");
			return;
		}
		f.action = "insert.jsp";
		f.submit();
	}
	// 4. 삭제
	function remove( f ) {
		if ( f.id.value == "" || f.pw.value == "" ) {
			alert("아이디와 비밀번호를 모두 입력한 뒤 삭제하세요.");
			return;
		}
		f.action = "remove.jsp";
		f.submit();
	}
	// 5. 수정
	function update_page( f ) {
		if ( f.id.value == "" || f.pw.value == "" ) {
			alert("아이디와 비밀번호를 모두 입력한 뒤 수정하세요.");
			return;
		}
		f.action = "update_page.jsp";
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
							<input type="button" value="전체 검색" onclick="view_all()" />&nbsp;&nbsp;
							<input type="button" value="아이디로 검색" onclick="view(this.form)" />&nbsp;&nbsp;
							<input type="button" value="회원 추가" onclick="insert(this.form)" />&nbsp;&nbsp;
							<input type="button" value="회원 삭제" onclick="remove(this.form)" />&nbsp;&nbsp;
							<input type="button" value="회원 수정" onclick="update_page(this.form)" />&nbsp;&nbsp;
							<input type="reset" value="다시 작성" />
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>