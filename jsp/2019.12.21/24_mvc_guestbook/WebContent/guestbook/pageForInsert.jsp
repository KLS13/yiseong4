<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성하기</title>
<style type="text/css">
	div {
		width: 800px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 800px;
		border-collapse: collapse;
	}
	td, th {
		border: 1px solid black;
		padding: 5px;
	}
	td:nth-of-type(1) {
		width: 200px;
	}
	td:nth-of-type(2) {
		width: 600px;
		text-align: left;
	}
</style>
<script type="text/javascript">
	
	function insert( f ) {
		
		if ( f.writer.value == "" ) {
			alert("작성자를 입력하세요.");
			f.writer.focus();
			return;
		}
		if ( f.title.value == "" ) {
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}
		if ( f.email.value == "" ) {
			alert("이메일을 입력하세요.");
			f.email.focus();
			return;
		}
		if ( f.pw.value == "" ) {
			alert("비밀번호를 입력하세요. 수정이나 삭제 시 필요합니다.");
			f.pw.focus();
			return;
		}
		if ( f.content.value == "" ) {
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		
		f.action = "/24_mvc_guestbook/insert.do";
		f.submit();
		
	}
</script>
</head>
<body>
	<div>
		<h1>방명록을 작성해 주세요</h1>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" size="80" autofocus /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size="80" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" size="80" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" size="80" /></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="filename" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="80" name="content" placeholder="내용을 입력하세요"></textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="방명록 저장하기" onclick="insert(this.form)" />&nbsp;&nbsp;
							<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='/24_mvc_guestbook/list.do'" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>