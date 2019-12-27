<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${result eq 0}">
		<script>
			alert("회원 탈퇴 실패했습니다.");
			location.href = "/26_mvc_member/index.do";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("회원 탈퇴 성공했습니다.");
			location.href = "/26_mvc_member/index.do";
		</script>
	</c:otherwise>
</c:choose>