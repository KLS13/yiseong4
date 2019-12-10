<%@page import="com.koreait.db.GreenDto"%>
<%@page import="com.koreait.db.GreenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	GreenDto dto = new GreenDto();
	dto.setId(id);
	dto.setPw(pw);
	
	GreenDao dao = GreenDao.getInstance();
	int result = dao.getRemove(dto);
	
	if(result > 0) {
		response.sendRedirect("view_all.jsp");
	}else{
%>
	<script>
		alert("회원 탈퇴 실패");
		history.go(-1);
	</script>
	<% } %>
</head>
<body>

</body>
</html>