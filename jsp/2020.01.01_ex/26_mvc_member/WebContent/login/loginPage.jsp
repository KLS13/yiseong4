<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 아이디 기억하기 -->
<%
	//아이디 기억하기가 체크되어 있으면 쿠키에 아이디가 저장되어 있다.
	//쿠키에 저장된 아이디를 saveId 에 저장해서 name="mId"에 자동삽입.
	Cookie[] cookieBox = request.getCookies();
	String saveId = null;
	if( cookieBox != null ) {
		for( Cookie cookie : cookieBox) { // cookieBox 에서 하나씩 빼봄.
			if(cookie.getName().equals("saveId")) { // saveId 라는 쿠키가 있느냐?
				saveId = cookie.getValue();
				break;
			}
		}
	}
	//EL 사용을 위해서 4가지 영역 안에 삽입
	pageContext.setAttribute("saveId", saveId);
%>
<jsp:include page="../template/header.jsp">
	<jsp:param value="로그인 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	function login( f ) {
		if ( f.mId.value == "" ) {
			alert("아이디를 입력하세요.");
			f.mId.focus();
			return;
		}
		if ( f.mPw.value == "" ) {
			alert("패스워드를 입력하세요.");
			f.mPw.focus();
			return;
		}
		f.action = "/26_mvc_member/login.do";
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
				<td>아이디</td>
				<c:choose>
					<c:when test="${saveId eq null }">
						<td><input type="text" name="mId" size="30" autofocus /></td>
					</c:when>
					<c:otherwise>
						<td><input type="text" name="mId" value="${saveId}" size="30" autofocus /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="mPw" size="30" /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="로그인" onclick="login(this.form)" />
					&nbsp;&nbsp;
					<input type="checkbox" name="saveIdCheck" value="true" checked />아이디 기억하기
					<br /><br />
					<a href="/26_mvc_member/searchIdPage.do">아이디 찾기</a>
					&nbsp;&nbsp;
					<a href="/26_mvc_member/searchPwPage.do">패스워드 찾기</a>
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
</div>

<%@ include file="../template/footer.jsp" %>