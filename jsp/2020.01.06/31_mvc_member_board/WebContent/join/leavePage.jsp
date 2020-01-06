<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="회원탈퇴 페이지" name="title" />
</jsp:include>

<script type="text/javascript">
	
	$(function() {
		$("#leaveBtn").click(function(){
			if ( !confirm("정말 탈퇴하시겠습니까?") ) {
				location.href = "/31_mvc_member_board/indexPage.me";
				return false;
			}
			$.ajax({
				url: "/31_mvc_member_board/ajaxLeave.me",
				type: "POST",
				dataType: "json",
				success: function( jsonObj ){
					var obj = eval( jsonObj );
					if ( obj.result == "SUCCESS" ) {
						alert("탈퇴되었습니다. 이용해 주셔서 감사합니다.");
						location.href = "/31_mvc_member_board/indexPage.me";
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

<form>
	<input type="button" value="회원탈퇴" id="leaveBtn" />
</form>


<%@ include file="/layout/footer.jsp" %>