<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/layout/header.jsp">
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
	$(function() {

		// 1. 아이디 중복체크
		var regExpId = /^[a-z]+[0-9a-z]{4,20}$/;

		$("#mId").keyup(function() {

			$.ajax({
				url : "/31_mvc_member_board/ajaxIdCheck.me",
				type : "POST",
				dataType : "json",
				data : "mId=" + $("#mId").val(),
				success : function(jsonObj) {

					var obj = eval(jsonObj);
					// obj["result"] : "result" 키 값에 저장된 value

					if (regExpId.test($("#mId").val())) {
						if (obj["result"] == "YES") {
							$("#idCheckResult").text("이미 사용 중인 아이디입니다.");
							$("#idCheckResult").css("color", "red");
						} else {
							$("#idCheckResult").text("이 아이디는 사용할 수 있습니다.");
							$("#idCheckResult").css("color", "blue");
						}
					} else {
						$("#idCheckResult").text("5~20자, 소문자 시작, 소문자+숫자");
						$("#idCheckResult").css("color", "red");
					}
				}, // end success
				error : function() {
					alert("실패");
				}
			}); // end ajax
		}); // end keyup (end 아이디 중복체크)

		$("#joinBtn").click(function() {
			
			$.ajax({
				url : "/31_mvc_member_board/ajaxJoinLogic.me",
				type : "POST",
				dataType : "json",
				data : $("#f").serialize(),
				success : function(data) {
					var obj = eval(data);
					if (obj["result"] == "SUCCESS") {
						alert("회원가입이 성공하였습니다.");
						location.href = "/31_mvc_member_board/loginPage.me"
					} else {
						alert("회원가입이 실패했습니다.");
						history.back();
					}
				}, // end success
				error : function() {
					alert("실패");
				}
			}); // end ajax
		}); // end click
		// 3. 입력 취소
		$("#cleanBtn").click(function(){
			$("input[text], input[password]").each(function(){
				$(this).val("");
			});
			$("#idCheckResult").val("");
			$("#mId").focus();
		}); // end click (end 입력 취소)
		
	}); // end 페이지로드
	
</script>

<div>
	<h1>회원가입</h1>
	<form method="post" name="joinForm" id="f">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="mId" id="mId" />
					<span id="idCheckResult"></span></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="mPw" id="mPw" /></td>
				</tr>
				<tr>
					<td>비밀번호확인</td>
					<td><input type="password" name="mPw2" id="mPw2" /></td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="mName" id="mName" /></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="text" name="mEmail" id="mEmail" /></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="mPhone" id="mPhone" /></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="mAddress" id="mAddress" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2">
						<input type="button" value="회원가입" id="joinBtn" />
						<input type="reset" value="입력취소" id="cleanBtn" />
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<%@ include file="/layout/footer.jsp"%>