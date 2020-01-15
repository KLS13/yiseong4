<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="회원탈퇴 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	
	
	$(function() {
		$("#leaveBtn").click(function(){
			if(f.agree.value != "탈퇴하겠습니다") {
				alert("입력하신 탈퇴 문구가 틀립니다.");
				return false;
			}
			if ( !confirm("정말 탈퇴하시겠습니까?") ) {
				location.href = "/myHome/indexPage.me";
				return false;
			}
			$.ajax({
				url: "/myHome/ajaxLeave.me",
				type: "POST",
				dataType: "json",
				success: function( jsonObj ){
					var obj = eval( jsonObj );
					if ( obj.result == "SUCCESS" ) {
						alert("탈퇴되었습니다. 이용해 주셔서 감사합니다.");
						location.href = "/myHome/indexPage.me";
					} else {
						alert("탈퇴되지 않았습니다.");
						history.back();
					}
				}, // end success
				error: function(){
					alert("실패");
				}
			}); // end ajax
		}); // end click (end 회원 탈퇴)
	}); // end 페이지로드
</script>

<form id="f">
	<h4>아래의 문구를 그대로 입력해주세요</h4>
	<h3 style="color:res">탈퇴하겠습니다</h3>
	<input type="text" name="agree" id="agree"/>
	<input type="button" value="회원탈퇴" id="leaveBtn"/>
</form>


<%@ include file="/layout/footer.jsp" %>