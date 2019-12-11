<%@page import="com.mybatis.GreenDao"%>
<%@page import="com.mybatis.GreenDto"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		GreenDao dao = GreenDao.getInstance();
		GreenDto dto = dao.selectById(id);
		
		pageContext.setAttribute("dto", dto);
	%>

	<jsp:include page="index.jsp" />
	<br /><hr /><br />
	
	<div>
		<h1>${param.id } 회원 정보</h1>
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
				<c:choose>
					<c:when test="${dto ne null }">
						<tr>
							<td>${dto.idx }</td>
							<td>${dto.id }</td>
							<td>${dto.pw }</td>
							<td>${dto.name }</td>
							<td>${dto.age }</td>
							<td>${dto.addr }</td>
							<td>${dto.reg_date }</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">${param.id } 회원 정보가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	<%// sqlSession.close(); %>
</body>
</html>