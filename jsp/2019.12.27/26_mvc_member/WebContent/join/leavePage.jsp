<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	window.onload = function() {
		if(confirm("정말 탈퇴하시겠습니까?")) {
			location.href = "/26_mvc_member/leave.do";
		}else {
			location.href = "/26_mvc_member/index.do";
		}
	}
</script>