<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="아이디 찾기 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	function searchId( f )  {
		if(f.mEmail.value == "") {
			alert("가입 당시 이메일을 입력하세요");
			f.mEmail.focus();
			return;
		}
		f.action = "/26_mvc_member/searchId.do";
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
				<td>가입 당시 이메일</td>
				<td><input type="text" name="mEmail" size="30" autofocus /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="아이디 찾기" onclick="searchId(this.form)" />
					&nbsp;&nbsp;
					<input type="button" value="로그인하러 가기" onclick="location.href='/26_mvc_member/loginPage.do'" />
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>

<%@ include file="../template/footer.jsp" %>