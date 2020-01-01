<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="비밀번호 찾기 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	function changePw( f ) {
		if ( f.mPw.value == "" ) {
			alert("비밀번호를 입력하세요.");
			f.mId.focus();
			return;
		} else if ( f.mPw.value != f.mPw2.value ) {
			alert("비밀번호 입력을 확인하세요.");
			f.mPw.focus();
			return;
		}
		f.action = "/26_mvc_member/changePw.do";
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
					<td>비밀번호 입력</td>
					<td><input type="password" name="mPw" size="30" autofocus /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" name="mPw2" size="30" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="비밀번호 변경" onclick="changePw(this.form)" />
						&nbsp;&nbsp;
						<input type="button" value="로그인하러 가기" onclick="location.href='/26_mvc_member/loginPage.do'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<%@ include file="../template/footer.jsp" %>