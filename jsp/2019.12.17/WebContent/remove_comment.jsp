<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String c_idx = request.getParameter("c_idx");
	String b_idx = request.getParameter("b_idx");
	String currentPage = request.getParameter("currentPage");
	
	BDao bdao = BDao.getInstance();
	bdao.getRemoveComment( Integer.parseInt(c_idx) );
	
	response.sendRedirect("view.jsp?b_idx=" + b_idx + "&currentPage=" + currentPage);
	
%>