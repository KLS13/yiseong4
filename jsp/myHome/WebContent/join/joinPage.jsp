<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

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
				url : "/myHome/ajaxIdCheck.me",
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
				url : "/myHome/ajaxJoinLogic.me",
				type : "POST",
				dataType : "json",
				data : $("#f").serialize(),
				success : function(data) {
					var obj = eval(data);
					if (obj["result"] == "SUCCESS") {
						alert("회원가입이 성공하였습니다.");
						alert("첫 회원가입 100포인트 적립");
						location.href = "/myHome/loginPage.me"
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
		$("#cleanBtn").click(function() {
			$("input[text], input[password]").each(function() {
				$(this).val("");
			});
			$("#idCheckResult").val("");
			$("#mId").focus();
		}); // end click (end 입력 취소)
		
		$(function() {
			$('#postBtn').click(function() {
				execDaumPostcode();
			});
			function execDaumPostcode() {
				new daum.Postcode(
						{
							oncomplete : function(data) {
								// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
								// 각 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullAddr = ''; // 최종 주소 변수
								var extraAddr = ''; // 조합형 주소 변수
								// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
								if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
									fullAddr = data.roadAddress;
								} else { // 사용자가 지번 주소를 선택했을 경우(J)
									fullAddr = data.jibunAddress;
								}
								// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
								if (data.userSelectedType === 'R') {
									//법정동명이 있을 경우 추가한다.
									if (data.bname !== '') {
										extraAddr += data.bname;
									}
									// 건물명이 있을 경우 추가한다.
									if (data.buildingName !== '') {
										extraAddr += (extraAddr !== '' ? ', '
												+ data.buildingName
												: data.buildingName);
									}
									// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
									fullAddr += (extraAddr !== '' ? ' ('
											+ extraAddr + ')' : '');
								}
								// 우편번호와 주소 정보를 해당 필드에 넣는다.
								document.getElementById('mAddress').value = data.zonecode; //5자리 새우편번호 사용
								document.getElementById('mAddress').value += "\t"
										+ fullAddr;

								// 커서를 상세주소 필드로 이동한다.
								document.getElementById('mAddressr').focus();
							}
						}).open();
			}
		});
	}); // end 페이지로드
</script>

<div>
	<h1>회원가입</h1>
	<form method="post" name="joinForm" id="f">
		<table>
			<tbody>
				<tr>
					<td>아이디</td>
					<td><input type="text" name="mId" id="mId" /> <span
						id="idCheckResult"></span></td>
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
					<td><input type="text" name="mAddress" id="mAddress" /> <input
						type="button" value="주소검색" id="postBtn" /></td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><input type="button" value="회원가입" id="joinBtn" />
						<input type="reset" value="입력취소" id="cleanBtn" /></td>
				</tr>
			</tfoot>
		</table>
	</form>
</div>

<%@ include file="/layout/footer.jsp"%>