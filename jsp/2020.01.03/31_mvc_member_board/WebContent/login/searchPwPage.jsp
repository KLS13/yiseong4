<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="패스워드찾기 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	
	$(function(){
		$("#searchPwBtn").click(function(){
			if ( $("#mId").val() == "" ) {
				alert("아이디를 입력하세요");
				$("#mId").focus();
				return false;
			}
			if ( $("#mPhone").val() == "" ) {
				alert("전화번호를 입력하세요");
				$("#mPhone").focus();
				return false;
			}
			$.ajax({
				url: "/31_mvc_member_board/ajaxSearchPw.me",
				type: "POST",
				dataType: "text",
				data: "mId=" + $("#mId").val() + "&mPhone=" + $("#mPhone").val(),
				success: function(data){
					if ( data.trim() == "YES" ) {
						alert("회원님의 정보가 확인되었습니다. 새로운 패스워드를 설정하세요.");
						location.href = "/31_mvc_member_board/changePwPage.me?mId=" + $("#mId").val();
					} else {
						alert("회원님의 정보가 없습니다.");
					}
				}, // end success
				error: function(){
					alert("실패");
				}
			}); // end ajax
		}); // end click
	}); // end 페이지로드
	
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
					<td><input type="text" name="mId" size="30" id="mId" /></td>
				</tr>
				<tr>
					<td>전화번호 입력</td>
					<td><input type="text" name="mPhone" size="30" id="mPhone" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="비밀번호 찾기" id="searchPwBtn" />
						&nbsp;&nbsp;
						<input type="button" value="로그인하러 가기" onclick="location.href='/31_mvc_member_board/loginPage.me'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<%@ include file="/layout/footer.jsp" %>