<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 수정하기</title>
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
	function update( f ) {
		var pw = "${dto.pw }"; // pw : 현재 방명록(session에 올라간 dto의 pw)의 비밀번호
		if ( f.pw.value != pw )	{ // f.pw.value : 이 화면에서 입력된 비밀번호
			alert("비밀번호가 올바르지 않습니다. 다시 입력하세요.");
			f.pw.focus();
			return;
		} else {
			var choice = confirm("방명록을 수정할까요?");
			if ( choice ) {
				f.action = "/24_mvc_guestbook/update.do";
			} else {
				f.action = "/24_mvc_guestbook/view.do";
			}
		}
		f.submit();
	}
</script>
</head>
<body>

	<div>
		<h1>${dto.writer }님의 방명록을 수정합니다.</h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>번호</td>
						<td>${dto.idx }<input type="hidden" name="idx" value="${dto.idx }" /></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${dto.writer }<input type="hidden" name="writer" value="${dto.writer }" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="${dto.title }" size="80" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" value="${dto.email }" size="80" /></td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pw" size="80" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="80" name="content">${dto.content }</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="방명록 저장하기" onclick="update(this.form)"/>&nbsp;&nbsp;
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