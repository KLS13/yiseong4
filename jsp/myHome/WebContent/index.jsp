<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- header.jsp (동적 포함) -->
<jsp:include page="/layout/header.jsp" />

<c:if test="${result gt 0 }">
	<script>
		alert("로그인 보너스 100포인트 적립");
	</script>
</c:if>
<%-- 관리자로 로그인하면 "관리자메뉴" 표시 --%>
<c:if test="${sessionScope.loginDto.mId eq 'admin' }">
<h1>관리자님 환영합니다</h1>
<input type="button" value ="회원관리" onclick="location.href='/myHome/memberPage.ad'" />
</c:if>
<%-- 일반유저로 로그인하면 "일반유저메뉴" 표시 --%>
<c:if test="${sessionScope.loginDto.mId ne 'admin' }">
<h1>홈페이지에 오신 걸 환영합니다</h1>
</c:if>
<!-- footer.jsp (정적 포함) -->
<%@ include file="/layout/footer.jsp" %>