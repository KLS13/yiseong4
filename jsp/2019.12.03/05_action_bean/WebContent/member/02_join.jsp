<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("utf-8"); %>

<jsp:include page="/template/02_header.jsp">
	<jsp:param value="회원가입" name="title"/>
</jsp:include>

			회원가입

<%@ include file="/template/02_footer.jsp" %>