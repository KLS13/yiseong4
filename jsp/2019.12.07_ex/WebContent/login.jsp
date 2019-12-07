<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		conn = DBConnect.getConnection();
		sql = "select * from green where id = ? and pw = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		rs = ps.executeQuery();
		if ( rs.next() ) {
			// 세션에 chk라는 이름으로 login_ok 값을 저장
			session.setAttribute("chk", "login_ok");
			out.println("<h1>" + id + "님 로그인 성공.</h1>");
			out.println("<a href='manager.jsp'>관리자 페이지로 이동</a>");
		}else { %> 
			<script type="text/javascript">
			var choice = confirm("아이디나 비밀번호가 잘못되었습니다.\n다시 입력할까요?");
			// confirm 에서 확인 버튼을 누르면 : true 리턴
			// confirm 에서 취소 버튼을 누르면 : false 리턴
			if ( choice ) {
				location.href = "loginPage.jsp"; // 로그인으로 이동
				// history.back();	이전 페이지
			} else {
				location.href = "joinPage.jsp";	// 회원가입으로 이동
			}
		</script> <%
		}
	} catch (Exception e) { %>
		<script type="text/javascript">
			var choice = confirm("아이디나 비밀번호가 잘못되었습니다.\n다시 입력할까요?");
			// confirm 에서 확인 버튼을 누르면 : true 리턴
			// confirm 에서 취소 버튼을 누르면 : false 리턴
			if ( choice ) {
				location.href = "loginPage.jsp"; // 로그인으로 이동
				// history.back();	이전 페이지
			} else {
				location.href = "joinPage.jsp";	// 회원가입으로 이동
			}
		</script> <%
	} finally {
		try {
			if (rs != null) { rs.close(); }
			if (ps != null) { ps.close(); }
			if (conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
%>

<style type="text/css">
	body {
		text-align: center;
	}
</style>