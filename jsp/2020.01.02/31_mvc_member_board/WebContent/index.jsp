<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- header.jsp (동적 포함) -->
<jsp:include page="/layout/header.jsp" />

<%-- 관리자로 로그인하면 "관리자메뉴" 표시 --%>
<h1>홈페이지에 오신 걸 환영합니다</h1>

<%-- 일반유저로 로그인하면 "일반유저메뉴" 표시 --%>
<h1>홈페이지에 오신 걸 환영합니다</h1>

<!-- footer.jsp (정적 포함) -->
<%@ include file="/layout/footer.jsp" %>