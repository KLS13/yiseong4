<%@page import="org.apache.catalina.ha.backend.Sender"%>
<%@page import="com.koreait.mybatis.JDto"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String writer = request.getParameter("writer");
		String pw = request.getParameter("pw");
		
		BDao bdao = BDao.getInstance();
		JDto jdto = new JDto();
		
		jdto.setWriter(writer);
		jdto.setPw(pw);
		int result = bdao.getInsertJoin(jdto);
		
		if(result > 0) {
	%>
		<script type="text/javascript">
		alert("회원가입 완료 !");
		</script>
	<% } %>
	
	
	<h1> 회원가입 완료 </h1>
	<a href="/2019.12.17_ex/login/login.jsp">로그인 하러가기</a>
		

	
		
		
		
</body>
</html>