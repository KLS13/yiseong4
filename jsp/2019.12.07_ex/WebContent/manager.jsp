<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<style type="text/css">
	body {
		text-align: center;
	}
	table {
		width: 400px;
		height: 150px;
		margin: auto;
		border-collapse: collapse;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
</style>
</head>
<body>
	<%
		// session 에 저장된 "chk" 속성을 확인한다.
		String res = (String)session.getAttribute("chk");
		
		if ( res == null ) { %>
			<script type="text/javascript">
				alert("로그인이 필요합니다. 로그인하세요.");
				location.href = "loginPage.jsp";
			</script> <%
		} else if ( res.equals("login_ok") ) {
			Connection conn = null;
			PreparedStatement ps = null;
			ResultSet rs = null;
			String sql = null;
			try {
				conn = DBConnect.getConnection();
				sql = "select * from green order by id";
				ps = conn.prepareStatement(sql);
				rs = ps.executeQuery(); %>
				<h1 style="text-align: center;">관리자 페이지</h1>
				<table>
					<thead>
						<tr>
							<th colspan="3">회원 정보 목록</th>
						</tr>
						<tr>
							<th>아이디</th>
							<th>성명</th>
							<th>삭제여부</th>
						</tr>
					</thead>
					<tbody>
					<%
						while ( rs.next() ) {
							out.println("<tr>");
							out.println("<td><a href='view.jsp?id=" + rs.getString("id") + "'>" + rs.getString("id") + "</a></td>");
							out.println("<td>" + rs.getString("name") + "</td>");
							out.println("<td><a href='removeConfirm.jsp?id=" + rs.getString("id") + "'>삭제</a></td>");
							out.println("</tr>");
						}
					%>
					</tbody>
				</table> <%
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null) { rs.close(); }
					if (ps != null) { ps.close(); }
					if (conn != null) { conn.close(); }
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	%>
</body>
</html>