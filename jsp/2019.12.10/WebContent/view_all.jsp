<%@page import="com.koreait.db.GreenDao"%>
<%@page import="com.koreait.db.GreenDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹색 회원 목록 보기</title>
</head>
<body>
	<jsp:include page="index.jsp"></jsp:include>
	<br /><hr /><br />
	
	<%	
		//List<GreenDto> list = GreenDao.getInstance().getAllList();
		GreenDao dao = GreenDao.getInstance();
		List<GreenDto> list = dao.getAllList();
		// EL은 4가지 영역에 저장된 데이터로 사용할 수 있다. 
		// 따라서 list를 바로 쓸 수 없고 4가지 영역중 하나인 pageContext 안에 넣어 사용.
 		pageContext.setAttribute("list", list);
	%>
		<div>
			<h1>전체 녹색 회원</h1>
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
					<%--  <% if ( list.size() > 0 ) %> --%>
					<c:if test="${not empty list}">
						<%-- <% for ( GreenDto dto : list ) %> --%>
						<c:forEach var="dto" items="${list}">
							<tr>
								<td>${dto.idx}</td>
								<td>${dto.id}</td>
								<td>${dto.pw}</td>
								<td>${dto.name}</td>
								<td>${dto.age}</td>
								<td>${dto.addr}</td>
								<td>${dto.reg_date}</td>
							</tr>
						</c:forEach>
						
					</c:if>
					<%-- <% if ( list.size() == 0 ) %> --%> 
					<c:if test="${empty list}">
						<tr>
							<td colspan="7"> 녹색회원이 한명도 없습니다. </td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
	
</body>
</html>