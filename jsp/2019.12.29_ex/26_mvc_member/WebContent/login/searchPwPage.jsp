<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호 찾기 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	function searchPw( f ) {
		if ( f.mId.value == "" ) {
			alert("아이디를 입력하세요.");
			f.mId.focus();
			return;
		}
		f.action = "/26_mvc_member/searchPw.do";
		f.submit();
	}
</script>
<style type="text/css">
	table {
		border-collapse: collapse;
		width: 400px;
		margin: auto;
	}
	td {
		border: 1px solid black;
		padding: 5px;
	}
	tfoot {
		text-align: center;
	}
</style>

<div>
	<form method="post">
		<table>
			<tbody>
				<tr>
					<td>아이디 입력</td>
					<td><input type="text" name="mId" size="30" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="비밀번호 찾기" onclick="searchPw(this.form)" />
						&nbsp;&nbsp;
						<input type="button" value="로그인하러 가기" onclick="location.href='/26_mvc_member/loginPage.do'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<%@ include file="../template/footer.jsp" %>