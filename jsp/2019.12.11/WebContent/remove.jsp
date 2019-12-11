<%@page import="com.mybatis.GreenDao"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mybatis.GreenDto"%>
<%@page import="com.mybatis.DBService"%>
<%@page import="com.mybatis.DBService2"%>
<%@page import="oracle.jdbc.driver.DBConversion"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
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
		request.setCharacterEncoding("utf-8");
		GreenDto dto = new GreenDto();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		
		GreenDao dao = GreenDao.getInstance();
		int result = dao.remove(dto);
		
		if(result > 0) {
			out.println("<script>");
			out.println("alert('회원이 삭제되었습니다.')");
			out.println("location.href='view_all.jsp'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('회원이 삽입되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		%>