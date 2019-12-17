<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시물 수정하기</title>
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
		var pw = "${bdto.pw}";	// session 에 저장된 현재 게시글이 bdto 이다.
		if ( f.pw.value != pw ) {
			alert("비밀번호가 일치하지 않습니다. 다시 시도하세요.");
			f.pw.focus();
			return;
		}
		if ( f.title.value == "" ) {
			alert("제목을 입력하세요.");
			f.title.focus();
			return;
		}
		if ( f.content.value == "" ) {
			alert("내용을 입력하세요.");
			f.content.focus();
			return;
		}
		f.action = "update.jsp";
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
		<h1>${bdto.b_idx }번 BBS 게시글을 수정합니다</h1>
		<form method="post" enctype="multipart/form-data">
			<table>
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${bdto.writer }<input type="hidden" name="writer" value="${bdto.writer }" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" value="${bdto.title }" size="80" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" size="80" /></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<input type="file" name="filename" />
							<c:if test="${bdto.filename ne null }">
								[ 기존 첨부 : ${bdto.filename } ]
								<input type="hidden" name="oldfile" value="${bdto.filename }" />
							</c:if>
							<c:if test="${bdto.filename eq null }">
								[ 기존 첨부 : 없음 ]
							</c:if>							
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="80" name="content">${bdto.content }</textarea></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="게시글 수정하기" onclick="update(this.form)" />&nbsp;&nbsp;
							<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="view_all(this.form)" />
							
							<%
								request.setCharacterEncoding("utf-8");
								String currentPage = request.getParameter("currentPage");
							%>
							<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
							<input type="hidden" name="currentPage" value="<%=currentPage %>" />

							<!-- update.jsp 에게 넘겨 줄 파라미터 b_idx(조건으로 사용)를 생성한다. -->
							<input type="hidden" name="b_idx" value="${bdto.b_idx }" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>