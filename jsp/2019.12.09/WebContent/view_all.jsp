<%@page import="com.db.GreenDto"%>
<%@page import="com.db.GreenDto"%>
<%@page import="java.util.List"%>
<%@page import="com.db.GreenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체검색</title>
</head>
<body>
	<%@ include file="index.jsp" %>
	<br /><hr /><br />
	<%
		// green 테이블의 전체 목록을 리턴하는 getAllList() 메소드 호출
		List<GreenDto> list = GreenDao.getInstance().getAllList();
	%>
	
	<div>
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
				<% if ( list.size() > 0 ) { %>
					<% for ( GreenDto dto : list ) { %>
						<tr>
							<td><%=dto.getIdx() %></td>
							<td><%=dto.getId() %></td>
							<td><%=dto.getPw() %></td>
							<td><%=dto.getName() %></td>
							<td><%=dto.getAge() %></td>
							<td><%=dto.getAddr() %></td>
							<td><%=dto.getReg_date() %></td>
						</tr>
					<% } %>
				<% } else { %>
					<tr>
						<td colspan="7">녹색 회원이 한 명도 없습니다.</td>
					</tr>
				<% } %>
			</tbody>
		</table>
	</div>

</body>
</html>