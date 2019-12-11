<%@page import="com.mybatis.GreenDao"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.mybatis.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	GreenDto dto = new GreenDto();
	dto.setId( request.getParameter("id") );
	dto.setPw( request.getParameter("pw") );
	dto.setName( request.getParameter("name") );
	dto.setAge( Integer.parseInt(request.getParameter("age")) );
	dto.setAddr( request.getParameter("addr") );
	
	GreenDao dao = GreenDao.getInstance();
	
	int result = dao.update(dto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('회원이 수정되었습니다.')");
		out.println("location.href='view_all.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('회원이 수정되지 않았습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	
%>