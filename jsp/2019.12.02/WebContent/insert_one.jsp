<%@page import="db_ex.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 삽입</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String age = request.getParameter("age");	// DB에 삽입할때는 int 형으로 타입을 바꿔서 처리한다.
		String addr = request.getParameter("addr");
	
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "insert into member values (member_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setInt(4, Integer.parseInt(age));
			ps.setString(5, addr);
			int result = ps.executeUpdate();
			// DB가 수정된 뒤이기 때문에 redirect 처리해서 페이지를 이동한다.
			// 시스템의 변화가 생긴 경우 : redirect
			// 시스템의 변화가 없는 경우 : forward
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