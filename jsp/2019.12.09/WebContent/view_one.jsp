<%@page import="com.db.GreenDto"%>
<%@page import="com.db.GreenDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 보기</title>
</head>
<body>
<%@ include file="index.jsp" %>
	<br /><hr /><br />
	
	<%	
		//green 테이블에서 전달된 id에 해당하는 회원을 리턴하는 getOneList() 메소드 호출
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		GreenDto dto = GreenDao.getInstance().getOneList(id);
	%>
	<div>
		<h1><%= id %> 회원의 정보</h1>
		<table>
		<thead>
			<tr>
				<th>순번</th>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>주소</th>
				<th>가입일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<% if( dto != null) {%>
				<td><%= dto.getIdx() %></td>
				<td><%= dto.getId() %></td>
				<td><%= dto.getPw() %></td>
				<td><%= dto.getName() %></td>
				<td><%= dto.getAge() %></td>
				<td><%= dto.getAddr() %></td>
				<td><%= dto.getReg_date() %></td>
			<% } else { %>
				<td colspan="7"> <%=id %> 회원 정보가 없습니다. </td>
			<% } %>
			<tr>
		</tbody>
		</table>
	</div>
</body>
</html>