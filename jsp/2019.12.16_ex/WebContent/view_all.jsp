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
		String sql = null;
		
		try {
			conn = DBConnect.getConnection();
			sql = "select * from member order by idx";	// idx의 오름차순 정렬로 검색한다.
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();		// 실행 결과 rs 는 여러 개의 검색 결과를 가지고 있을 수 있기 때문에 while 과 같은 반복문으로 출력해야 한다.
	%>
	
	<%-- rs(결과집합) 화면에 출력하기 : html 태그로 작업 --%>
	<div>
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
				<% if ( !rs.next() ) { %>	<!-- 일단 rs.next()를 호출하면 사용해야 한다. 사용하지 않고 rs.next() 를 다시 호출하면 처음에 호출한 결과는 덮어쓰기되어 사라진다. -->
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
								SimpleDateFormat sdf = new SimpleDateFormat("yy/MM/dd");	// 19/12/31 형식(2019년 12월 31일을 의미함)
							%>
							<td><%=sdf.format(rs.getDate(7)) %></td>
						</tr>
					<% } while ( rs.next() ); %>
				<% } %>
			</tbody>
		</table>
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