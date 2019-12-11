<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인덱스 페이지</title>
<style type="text/css">
	div {
		width: 700px;
		margin: auto;
		text-align: center;
		box-sizing: border-box;
	}
	div table {
		width: 700px;
		border-collapse: collapse;
	}
	div table th, td {
		border: 1px solid silver;
		padding: 10pt;
	}
</style>
<script type="text/javascript">
	function view_one( f ) {
		if ( f.id.value == "" ) {
			alert("검색할 회원의 아이디를 먼저 입력하세요.");
			f.id.focus();
			return;
		}
		f.action = "view_one.jsp";
		f.submit();
	}
	function insert_one( f ) {
		if ( f.id.value == "" ) {
			alert("검색할 회원의 아이디를 먼저 입력하세요.");
			f.id.focus();
			return;
		}
		if ( f.pw.value == "" ) {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요.");
			f.pw.focus();
			return;
		}
		if ( f.name.value == "" ) {
			alert("검색할 회원의 성명을 먼저 입력하세요.");
			f.name.focus();
			return;
		}
		if ( f.age.value == "" ) {
			alert("검색할 회원의 나이를 먼저 입력하세요.");
			f.age.focus();
			return;
		}
		if ( f.addr.value == "" ) {
			alert("검색할 회원의 주소를 먼저 입력하세요.");
			f.addr.focus();
			return;
		}
		f.action = "insert.jsp";
		f.submit();
	}
	function remove_one( f ) {
		if ( f.id.value == "" ) {
			alert("검색할 회원의 아이디를 먼저 입력하세요.");
			f.id.focus();
			return;
		}
		if ( f.pw.value == "" ) {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요.");
			f.pw.focus();
			return;
		}
		f.action = "remove.jsp";
		f.submit();
	}
	function update_page_go( f ) {
		if ( f.id.value == "" ) {
			alert("검색할 회원의 아이디를 먼저 입력하세요.");
			f.id.focus();
			return;
		}
		if ( f.pw.value == "" ) {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요.");
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
		<form method="post">
			<table>
				<thead><tr><th colspan="2">녹색 회원 관리</th></tr></thead>
				<tbody>
					<tr>
						<td>아이디</td>
						<td><input type="text" name="id" size="50" autofocus /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" size="50" /></td>
					</tr>
					<tr>
						<td>성명</td>
						<td><input type="text" name="name" size="50" /></td>
					</tr>
					<tr>
						<td>나이</td>
				
						<td><input type="text" name="age" size="50" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr" size="50" /></td>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="button" value="전체검색" onclick="location.href='view_all.jsp'" />&nbsp;&nbsp;
							<input type="button" value="회원검색" onclick="view_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="회원추가" onclick="insert_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="회원삭제" onclick="remove_one(this.form)" />&nbsp;&nbsp;
							<input type="button" value="회원수정" onclick="update_page_go(this.form)" />&nbsp;&nbsp;
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>