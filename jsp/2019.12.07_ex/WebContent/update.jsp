<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	
	Connection conn = null;
	PreparedStatement ps = null;
	String sql = null;
	int result = 0;
	
	try {
		conn = DBConnect.getConnection();
		sql = "update green set pw = ?, name = ?, addr = ? where id = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, pw);
		ps.setString(2, name);
		ps.setString(3, addr);
		ps.setString(4, id);

		result = ps.executeUpdate();
		if (result > 0) { %>
			<script type="text/javascript">
				alert("회원정보 변경 성공.");
				location.href = "view.jsp?id=<%=id%>";
			</script> <%
    	} 
    } catch (Exception e) { %>
    	<script type="text/javascript">
			if( confirm("회원정보 변경에 실패했습니다. 다시 변경하시겠습니까?") ) {
				history.back();    		// 이전 페이지로 이동
			} else {
				location.href = "view.jsp?id=<%=id%>";
			}
		</script> <%
	} finally {
		try {
			if (ps != null) { ps.close(); }
			if (conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>    