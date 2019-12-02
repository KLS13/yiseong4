<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db_ex.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 검색</title>
</head>
<body>
	
	<%-- 정적 페이지(변하지 않는 페이지) 포함 방식 --%>
	<%@ include file="index.jsp" %>
	
	<br /><hr /><br />
	
	<%
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "select * from member order by idx";	// idx의 오름차순 정렬
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
	%>
	
	<%-- rs(결과집합) 화면에 출력하기 : html 태그로 작업 --%>
	<h1>member 테이블의 전체 데이터</h1>
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
			<% if ( !rs.next() ) { %>
				<tr>
					<td colspan="7">member 가 없습니다.</td>
				</tr>
			<% } else { %>
				<% do { %>
					<tr>
						<td><%=rs.getInt(1) %></td>
						<td><%=rs.getString(2) %></td>
						<td><%=rs.getString(3) %></td>
						<td><%=rs.getString(4) %></td>
						<td><%=rs.getInt(5) %></td>
						<td><%=rs.getString(6) %></td>
						<%
							SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");
						%>
						<td><%=sdf.format(rs.getDate(7)) %></td>
					</tr>
				<% } while ( rs.next() ); %>
			<% } %>
		</tbody>
	</table>
	
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