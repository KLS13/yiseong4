<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String currentPage = request.getParameter("currentPage");
	int bIdx = Integer.parseInt(request.getParameter("bIdx"));
	pageContext.setAttribute("currentPage", currentPage);
	pageContext.setAttribute("bIdx", bIdx);
%>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="게시글 작성하기" name="title" />
</jsp:include>

<script type="text/javascript">
	function replyWrite(f) {
		f.action = "/31_mvc_member_board/replyWrite.bo";
		f.submit();
	}
</script>

<style type="text/css">
	table {
		border-collapse: collapse;
		width: 600px;
		margin: auto;
	}
	td {
		border: 1px solid black;
		padding: 5px;
	}
	tfoot {
		text-align: center;
	}
	td:nth-of-type(1) {
		width: 120px;
	}
	td:nth-of-type(2) {
		width: 480px;
		text-align: left; 
	}
</style>

<form method="post">
	<!-- hidden -->
	<input type="hidden" name="currentPage" value="${currentPage }" />
	<input type="hidden" name="bIdx" value="${bIdx}" />
	
	
	<table>
		<tbody>
			<tr>
				<td>제목</td>
				<td><input type="text" name="bTitle" size="30" /></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="mId" size="30" value="${loginDto.mId }" readonly /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="70" name="bContent"></textarea></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="bPw" /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="댓글등록" onclick="replyWrite(this.form)" />
					<input type="reset" value="다시작성" />
					<input type="button" value="목록으로 이동" onclick="location.href='/31_mvc_member_board/boardList.bo?currentPage=${currentPage }'" />
				</td>
			</tr>
		</tfoot>
	</table>
</form>

<%@ include file="/layout/footer.jsp" %>