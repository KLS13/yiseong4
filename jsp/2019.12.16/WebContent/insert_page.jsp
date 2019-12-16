<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시물 작성하기</title>
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
		f.action = "insert.jsp";
		f.submit();
	}
	
	function view_all( f ) {
		f.action = "index.jsp";
		f.submit();
	}
	
</script>
</head>
<body>
	<div>
		<h1>BBS 게시글을 작성해 주세요</h1>
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
							<input type="button" value="게시글 저장하기" onclick="insert(this.form)" />&nbsp;&nbsp;
							<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="view_all(this.form)" />
							
							<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
							<input type="hidden" name="" value="" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>