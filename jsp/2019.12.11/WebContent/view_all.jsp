<%@page import="com.mybatis.GreenDao"%>
<%@page import="com.mybatis.GreenDto"%>
<%@page import="com.mybatis.DBService"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
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

	<%-- sqlSession 생성 --%>
	<%
	//	SqlSessionFactory factory = DBService.getFactory();
	//	SqlSession sqlSession = factory.openSession();
		/*
			openSession()		select 문
			openSession(true)	자동 커밋
			openSession(false)	수동 커밋	insert, update, delete 문
			// 일반적인 트랜잭션 처리는 "수동 커밋"으로 처리한다.
		*/
	%>
	
	<%-- sqlSession 을 통해서 mapper 에 접근 --%>
	<%
	//	List<GreenDto> list = sqlSession.selectList("select_all");
	//	pageContext.setAttribute("list", list);
		/*
			select 문의 메소드
			1. selectList("sql문의 id")
			2. selectList("sql문의 id", 파라미터)
			3. selectOne("sql문의 id")
			4. selectOne("sql문의 id", 파라미터)
		*/
	%>
	
	<%-- GreenDao를 통한 List<GreenDao> list 처리 --%>
	<%
		GreenDao dao = GreenDao.getInstance();
		List<GreenDto> list = dao.selectAll();
		pageContext.setAttribute("list", list);
	%>
	
	<jsp:include page="index.jsp" />
	<br /><hr /><br />
	
	<div>
		<h1>녹색 회원 전체 명단</h1>
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
					<c:when test="${not empty list }">
						<c:forEach var="dto" items="${list }">
							<tr>
								<td>${dto.idx }</td>
								<td>${dto.id }</td>
								<td>${dto.pw }</td>
								<td>${dto.name }</td>
								<td>${dto.age }</td>
								<td>${dto.addr }</td>
								<td>${dto.reg_date }</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="7">녹색 회원이 한 명도 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
	
	<% //sqlSession.close(); %>

</body>
</html>