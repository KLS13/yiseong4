<%@page import="java.text.SimpleDateFormat"%>
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
<title>회원 검색</title>
</head>
<body>

	<%@ include file="index.jsp" %>
	
	<br /><hr /><br />
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			conn = DBConnect.getConnection();
			sql = "select * from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
	%>
	<div>
		<h1>검색된 member</h1>
		<table>
			<thead>
				<tr>
					<th>순번</th>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>성명</th>
					<th>나이</th>
					<th>주소</th>
					<th>가입일</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<% if ( rs.next() ) { %>
						<td><%=rs.getInt("idx") %></td>
						<td><%=rs.getString("id") %></td>
						<td><%=rs.getString("pw") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getInt("age") %></td>
						<td><%=rs.getString("addr") %></td>
						<td><%=(new SimpleDateFormat("yy/MM/dd")).format(rs.getDate("reg_date")) %></td>
					<% } else { %>
						<td colspan="7">
							<%=id %> 회원 정보가 없습니다.
						</td>
					<% } %>
				</tr>
			</tbody>
		</table>
		<br />
		<form action="update_page.jsp" method="post">
			<input type="submit" value="수정하기" />
			<input type="hidden" name="id" value="<%=rs.getString("id") %>" /> <!-- 수정 페이지에서는 id 와 pw 를 이용해 회원 정보를 DB로부터 가져온다. -->
			<input type="hidden" name="pw" value="<%=rs.getString("pw") %>" /> <!-- id, pw 파라미터를 넘겨주기 위해 hidden 타입을 사용할 수 있다. -->
		</form>
	</div>
	<%
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				
			}
		}
	%>

</body>
</html>