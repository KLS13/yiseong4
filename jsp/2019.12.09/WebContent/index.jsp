<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	th,td {
		padding : 7px;
	}
	input[type=button]:hover {
		background: black;
		color : white;
	}
</style>
<script type="text/javascript">
	function view_one(f) {
		if(f.id.value=="") {
			alert("검색할 회원의 아이디를 먼저 입력하세요");
			f.id.focus();
			return;
		}
		f.action = "view_one.jsp";
		f.submit();
	}
	function insert_one(f) {
		if(f.id.value=="") {
			alert("검색할 회원의 아이디를 먼저 입력하세요");
			f.id.focus();
			return;
		}
		if(f.pw.value=="") {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요");
			f.pw.focus();
			return;
		}
		if(f.name.value=="") {
			alert("검색할 회원의 이름을 먼저 입력하세요");
			f.name.focus();
			return;
		}
		if(f.age.value=="") {
			alert("검색할 회원의 나이를 먼저 입력하세요");
			f.age.focus();
			return;
		}
		if(f.addr.value=="") {
			alert("검색할 회원의 주소를 먼저 입력하세요");
			f.addr.focus();
			return;
		}
		f.action = "insert.jsp";
		f.submit();
		}
	function remove_one ( f ) {
		if(f.id.value=="") {
			alert("검색할 회원의 아이디를 먼저 입력하세요");
			f.id.focus();
			return;
		}
		if(f.pw.value=="") {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요");
			f.pw.focus();
			return;
		}
		f.action = "remove.jsp";
		f.submit();
	}
	
	function update_page_go ( f ) {
		if(f.id.value=="") {
			alert("검색할 회원의 아이디를 먼저 입력하세요");
			f.id.focus();
			return;
		}
		if(f.pw.value=="") {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요");
			f.pw.focus();
			return;
		}
		f.action = "update_page.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<form method = "post">
			<table border="1">
				<thead><tr><th colspan="2">녹색 회원 관리</th></tr></thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" autofocus /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="number" name="age"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr"/></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2">
							<input type="button" value="전체검색" onclick="location.href='view_all.jsp'" />&nbsp;&nbsp;
							<input type="button" value="검색" onclick="view_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="삽입" onclick="insert_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="삭제" onclick="remove_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="수정" onclick="update_page_go(this.form)" />&nbsp;&nbsp;
						</th>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>