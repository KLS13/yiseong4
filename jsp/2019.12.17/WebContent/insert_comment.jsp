<%@page import="com.koreait.mybatis.CDto"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	CDto cdto = new CDto();
	cdto.setB_idx(Integer.parseInt(request.getParameter("b_idx")));
	cdto.setContent(request.getParameter("content"));
	cdto.setIp(request.getRemoteAddr());
	cdto.setPw(request.getParameter("pw"));
	cdto.setWriter(request.getParameter("writer"));
	
	BDao bdao = BDao.getInstance();
	bdao.getInsertComment(cdto);	
	
	String currentPage = request.getParameter("currentPage");
	response.sendRedirect("view.jsp?b_idx=" + cdto.getB_idx() + "&currentPage=" + currentPage);
%>
	
</body>
</html>