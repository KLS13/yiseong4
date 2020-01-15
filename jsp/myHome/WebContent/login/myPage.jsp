<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="마이페이지" name="title" />
</jsp:include>

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

<script type="text/javascript">
	$(function(){
		// 1. 회원정보수정
		$("#updateMemberBtn").click(function(){
			$.ajax({
				url: "/myHome/ajaxUpdate.me",
				type: "POST",
				dataType: "json",
				data: $("#f").serialize(), // 직렬화: mId=mId&mPw=mPw&...
				success: function( jsonObj ) {
					var obj = eval( jsonObj );
					if ( obj["result"] == "SUCCESS" ) {
						alert("회원정보가 수정되었습니다.");
					} else {
						alert("회원정보가 수정되지 않았습니다.");
					}
					location.href = "/myHome/myPage.me";
				}, // end success
				error: function(){
					alert("실패");
				}
			}); // end ajax
		}); // end click (end 회원정보수정)
	}); // end 페이지로드
</script>

<div>
	<h1>회원 정보</h1>
    <form method="post" id="f">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td>
						${loginDto.mId }
						<input type="hidden" name="mId" id="mId" value="${loginDto.mId }" />
					</td>
				</tr>
				<tr>
					<td>변경할 비밀번호</td>
					<td><input type="password" name="mPw" id="mPw"/></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="mName" id="mName" value="${loginDto.mName }" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="mEmail" id="mEmail" value="${loginDto.mEmail }" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="mPhone" id="mPhone" value="${loginDto.mPhone }" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="mAddress" id="mAddress" value="${loginDto.mAddress }" /></td>
				</tr>
				<tr>
					<td>보유 포인트</td>
					<td>${loginDto.mPoint }</td>
			</tbody>
			<tfoot>
				<tr>
					<th colspan="2">
						<input type="button" value="회원정보수정" id="updateMemberBtn"/>
					</th>
				</tr>
			</tfoot>
		</table>
	</form>
</div>
 
<%@ include file="/layout/footer.jsp" %>