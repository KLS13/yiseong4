<%@page import="db_ex.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 삭제</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "delete from member where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			int result = ps.executeUpdate();
			response.sendRedirect("/04_DB_02/view_all.jsp");
		} catch (Exception e) {
			response.sendRedirect("/04_DB_02/view_all.jsp");
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				
			}
		}
	%>

</body>
</html>