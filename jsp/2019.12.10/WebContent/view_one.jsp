<%@page import="com.koreait.db.GreenDto"%>
<%@page import="com.koreait.db.GreenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<jsp:include page="index.jsp" />
	<br /><hr /><br />
	
	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		
		GreenDao dao = GreenDao.getInstance();
		GreenDto dto = dao.getOneList(id);
		
		pageContext.setAttribute("dto",dto);
	%>
	
	<div>
			<h1>${param.id} 회원의 정보</h1>
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
					<c:if test="${dto ne null}">
								<td>${dto.idx}</td>
								<td>${dto.id}</td>
								<td>${dto.pw}</td>
								<td>${dto.name}</td>
								<td>${dto.age}</td>
								<td>${dto.addr}</td>
								<td>${dto.reg_date}</td>
					</c:if>							

					<c:if test="${dto eq null}">
						<tr>
							<td colspan="7"> ${param.id} 라는 녹색회원이 없습니다. </td>
						</tr>
					</c:if>
					</tr>
				</tbody>
			</table>
		</div>
	
</body>
</html>