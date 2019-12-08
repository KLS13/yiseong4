<%@page import="org.apache.jasper.tagplugins.jstl.core.Param"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");	
%>
<%
	if( id != null) {
	out.print(id + " 님 환영합니다.");
	}else {
		out.print("회원가입 실패");
	}
%>
