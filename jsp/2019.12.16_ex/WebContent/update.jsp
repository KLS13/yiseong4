<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String idx = request.getParameter("idx");	// DB에 전달할때는 int 형으로 변환 후에 전달한다.
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");	// DB에 전달할때는 int 형으로 변환 후에 전달한다.
	String addr = request.getParameter("addr");

	Connection conn = null;
	PreparedStatement ps = null;
	int result = 0;
	String sql = null;
	
	try {
		conn = DBConnect.getConnection();
		sql = "update member set pw = ?, name = ?, age = ?, addr = ? where idx = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, name);
		ps.setInt(3, Integer.parseInt(age));
		ps.setString(4, addr);
		ps.setInt(5, Integer.parseInt(idx));
		result = ps.executeUpdate();
		if ( result > 0 ) { %>
			<script type="text/javascript">
				alert("회원 정보가 수정되었습니다.");
				location.href = "view_all.jsp";
			</script>
		<% } else { %>
			<script type="text/javascript">
				alert("회원 정보가 수정되지 않았습니다.");
				location.href = "view_all.jsp";
			</script>
		<% } 
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