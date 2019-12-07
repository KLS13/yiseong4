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
<title>회원 상세 보기</title>
<style>
	table {
		width: 800px;
		height: 200px;
		margin: auto;
		border-collapse: collapse;
	}
	td {
		width: 100px;
		border: 1px solid black;
		text-align: center;
		padding: 10px;
	}
</style>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		conn = DBConnect.getConnection();
		sql = "select * from green where id = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery(); %>
		<table>
			<thead>
				<tr>
					<td colspan="7">회원 정보</td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>회원번호</td>
					<td>아이디</td>
					<td>비밀번호</td>
					<td>이름</td>
					<td>성별</td>
					<td>주소</td>
					<td>가입일</td>
				</tr>
				<tr>
				<%
					if ( rs.next() ) {
						out.println("<td>" + rs.getInt("idx") + "</td>");
						out.println("<td>" + rs.getString("id") + "</td>");
						out.println("<td>" + rs.getString("pw") + "</td>");
						out.println("<td>" + rs.getString("name") + "</td>");
						out.println("<td>" + rs.getInt("age") + "</td>");
						out.println("<td>" + rs.getString("addr") + "</td>");
						out.println("<td>" + rs.getDate("reg_date") + "</td>");
					} else {
						out.println("<td colspan='7'>관리자에게 문의하세요.(xxx-xxxx-xxxx)</td>");
					}
				%>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="7">
						<input type="button" value="리스트로 이동" onclick="location.href='manager.jsp'" /> 
						<input type="button" value="수정하기" onclick="location.href='updatePage.jsp?id=<%=id%>'" />
					</td>
				</tr>
			</tfoot>
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
%>
</body>
</html>