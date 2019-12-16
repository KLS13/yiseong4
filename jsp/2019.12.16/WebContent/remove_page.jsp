<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시물 삭제하기</title>
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
	
	function remove( f ) {
		var pw = "${bdto.pw}";	// session 에 저장된 현재 게시글이 bdto 이다.
		if ( f.pw.value != pw ) {
			alert("비밀번호가 일치하지 않습니다. 다시 시도하세요.");
			f.pw.focus();
			return;
		}else {
			if(confirm("정말 삭제하시겠습니까?")) {
				f.action = "remove.jsp";
				f.submit();
			}else {
				history.back();
			}
		}
	}
	
	function view_all(f) {
		f.action = "index.jsp";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h1>${bdto.b_idx }번 BBS 게시글을 삭제합니다</h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${bdto.writer }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${bdto.title }</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" size="80" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="게시글 삭제하기" onclick="remove(this.form)" />&nbsp;&nbsp;
							<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="view_all(this.form)" />
							
							<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
							<input type="hidden" name="" value="" />

							<!-- remove.jsp 에게 넘겨 줄 파라미터 b_idx(조건으로 사용)를 생성한다. -->
							<input type="hidden" name="b_idx" value="${bdto.b_idx }" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>