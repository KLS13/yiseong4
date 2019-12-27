<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp" /> <!-- 파라미터 전달 가능(동적 포함) -->

<h1>홈페이지에 오신 걸 환영합니다.</h1>

<%@ include file="/template/footer.jsp" %> <!-- 파라미터 전달 불가(정적 포함) -->