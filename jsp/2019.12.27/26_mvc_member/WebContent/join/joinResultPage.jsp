<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${result eq 0}">
		<script>
			alert("회원 가입 실패 ! 다시 시도하세요.");
			location.href = "/26_mvc_member/joinPage.do";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원 가입 성공");
			location.href = "/26_mvc_member/loginPage.do";
		</script>
	</c:otherwise>
</c:choose>