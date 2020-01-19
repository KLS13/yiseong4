<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setCharacterEncoding("utf-8");
	String currentPage = request.getParameter("currentPage");
	pageContext.setAttribute("currentPage", currentPage);
%>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="게시글 보기" name="title" />
</jsp:include>

<script type="text/javascript">
	function boardDelete(f) {
		var pw = "${bDto.bPw}";
		if ( pw != f.bPw.value ) {
			alert("비밀번호가 올바르지 않습니다.");
			f.bPw.focus();
			return;
		}
		f.action = "/myHome/boardDelete.bo";
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

	<div style="text-align: right;">
		삭제비밀번호: <input type="password" name="bPw" />
		<input type="hidden" name="bIdx" value="${bDto.bIdx }" />
		<c:if test="${loginDto.mId eq 'admin' }">
		<input type="button" value="삭제" onclick="location.href='/myHome/boardDelete.bo?bIdx=${bDto.bIdx }'"/>
		</c:if>
		<c:if test="${loginDto.mId ne 'admin' }">
		<input type="button" value="삭제" onclick="boardDelete(this.form)" />
		</c:if> 
	</div>
	
	<br />

	<table>
		<tbody>
			<tr>
				<td>제목</td>
				<td>${bDto.bTitle }</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>${bDto.mId }</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><pre>${bDto.bContent }</pre></td>
			</tr>
			<tr>
				<td>작성일</td>
				<td>${bDto.bPostDate }</td>
			</tr>
			<tr>
				<td>IP</td>
				<td>${bDto.bIp }</td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="댓글달기" onclick="" />
					<input type="button" value="목록으로 이동" onclick="location.href='/myHome/boardList.bo?currentPage=${currentPage }'" />
					<input type="hidden" name="currentPage" value="${currentPage }" />
				</td>
			</tr>
		</tfoot>
	</table>
</form>

<%@ include file="/layout/footer.jsp" %>