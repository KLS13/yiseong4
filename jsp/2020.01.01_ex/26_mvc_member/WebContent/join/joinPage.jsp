<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="../template/header.jsp">
	<jsp:param value="회원가입 페이지" name="title" />
</jsp:include>

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
	td:nth-of-type(2) {
		text-align: left; 
	}
</style>
<script type="text/javascript">
	var isChecked = false;  // 중복체크시 true로 변경함.

	function idCheck( f ) {
		// 팝업창 방식의 중복 체크
		if( f.mId.value == "") {
			alert("아이디를 먼저 입력해주세요.");
			f.mId.focus();
			return;
		}
		//중복확인했다~ isChecked 값 변경
		isChecked = true;
		//창 열기 open
		var path = "/26_mvc_member/join/idCheck.jsp?mId="+f.mId.value;
		open(path, "", "width=400 height=300 top=100 left=100");
	}
	
	function join( f ) {
		if( !isChecked) {
			alert("아이디 중복체크를 진행하세요.");
			return;
		}
		//정규표현식을 이용한 입력 체크
		f.action="/26_mvc_member/join.do";
		f.submit();
		
	}
</script>

<div>
	<h1>회원가입</h1>
    <form method="post" name="joinForm">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" name="mId" />
						<input type="button" value="중복확인" onclick="idCheck(this.form)" />
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mPw" /></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="mPw2" /></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="mName" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="mEmail" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="mPhone" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="회원가입" onclick="join(this.form)" />
						<input type="reset" value="입력취소" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
 
<%@ include file="../template/footer.jsp" %>