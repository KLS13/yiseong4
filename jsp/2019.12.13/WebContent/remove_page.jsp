<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 삭제 확인</title>
<script type="text/javascript">

	function remove( f ) {
		var pw = "${dto.pw }";	// 현재 방명록의 비밀번호
		if ( f.pw.value == "" ) {
			alert("방명록 작성 시 설정한 비밀번호를 입력하세요.");
			f.pw.focus();
			return;
		} else if ( f.pw.value != pw ) {
			alert("비밀번호 오류입니다. 다시 입력하세요.");
			f.pw.focus();
			return;
		} else {
			var choice = confirm("정말 삭제할까요?");
			if ( choice ) {
				f.action = "remove.jsp";
			} else {
				f.action = "view.jsp";
				// f.action = "view.jsp?idx=${dto.idx}";	hidden 대신 가능하지만,
				// f.action = "remove.jsp?idx=${dto.idx}";	도 해야 하므로 hidden 한 번이 좋다. 
			}
		}
		f.submit();
	}

</script>
</head>
<body>
	<div>
		<h1>${dto.writer }의 방명록 삭제 확인</h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>제목</td>
						<td>${dto.title }</td>
					</tr>
					<tr>
						<td>비밀번호 확인</td>
						<td><input type="password" name="pw" size="80" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="방명록 삭제" onclick="remove(this.form)" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'" />
							<input type="hidden" name="idx" value="${dto.idx }" />
						</td>
					</tr>
				</tbody>			
			</table>
		</form>
	</div>
</body>
</html>