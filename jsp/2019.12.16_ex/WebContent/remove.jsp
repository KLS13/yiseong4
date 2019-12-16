<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 전달 받은 파라미터의 인코딩 처리 및 저장
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	// DB 연결 및 처리를 위한 변수 선언
	Connection conn = null;
	PreparedStatement ps = null;
	int result = 0;
	String sql = null;
	
	// DB 연결 및 처리
	try {
		conn = DBConnect.getConnection();
		sql = "delete from member where id = ? and pw = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		result = ps.executeUpdate();
		if ( result > 0 ) {
			response.sendRedirect("view_all.jsp");
		}
	} catch (Exception e) {
		response.sendRedirect("view_all.jsp");
	} finally {
		try {
			if ( ps != null ) { ps.close(); }
			if ( conn != null ) { conn.close(); }
		} catch (Exception e) {
			
		}
	}
%>