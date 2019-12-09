<%@page import="db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("user_id");
	String pw = request.getParameter("user_password");

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
	
		try {
			conn = DBConnect.getConnection();
			String sql = "select * from member where id = ? and password = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if( rs.next()) {
				session.setAttribute("ID",id);
				session.setAttribute("PW",pw);
				response.sendRedirect("loginView.jsp");
			}
			
			}catch(Exception e) {
				e.printStackTrace();
			}finally{
				try{
					if(ps != null) {
						ps.close();
					}
					if(conn != null) {
						conn.close();
					}
			}catch(Exception e) {
		}
	}
		
%>