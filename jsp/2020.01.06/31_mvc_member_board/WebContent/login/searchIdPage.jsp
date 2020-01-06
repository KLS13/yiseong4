<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="/layout/header.jsp">
	<jsp:param value="아이디 찾기 페이지" name="title"/>
</jsp:include>

<script type="text/javascript">
	// ajax를 통한 아이디 찾기
	$(function(){
		$("#searchIdBtn").click(function(){
			$.ajax({
				url : "/31_mvc_member_board/ajaxSearchId.me", 
				type : "POST",
				dataType : "text",
				data : "mEmail=" + $("#mEmail").val(),  // ajaxSearchId.me 에게 전달하는 파라미터 , MemberController 의 *.me로 전달하는것이 아님.
				success : function(data) { // 결과 data : "찾은 아이디" 또는 "NO"
					if(data.trim() != "NO") { // data.trim() : 좌우의 불필요한 공백 제거
						$("#searchIdResult").text("회원님의 아이디는" + data);
						$("#searchIdResult").css("color", "blue").css("font-weight", "bold");
					}else {
						$("#searchIdResult").text("회원님의 정보가 없습니다.");
						$("#searchIdResult").css("color", "red").css("font-weight", "bold");
					}
				}, // end success
				error : function(){
					alert("아이디 찾기 실패");
				}
			}); // end ajax
		}); //end click
	}); // end 페이지 로드
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
				<td><input type="text" name="mEmail" size="30" id="mEmail" autofocus /></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="button" value="아이디 찾기" id="searchIdBtn"/>
					&nbsp;&nbsp;
					<input type="button" value="로그인하러 가기" onclick="location.href='/31_mvc_member_board/loginPage.do'" />
				</td>
			</tr>
		</tfoot>
	</table>
	</form>
	<br /><br />
	<div id="searchIdResult"> <!-- ajax 처리 결과가 나타난다. -->
	
	</div>
</div>

<%@ include file="/layout/footer.jsp" %>