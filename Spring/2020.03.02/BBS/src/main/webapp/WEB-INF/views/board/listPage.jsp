<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../layout/header.jsp"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
 <thead>
  <tr>
   <th>번호</th>
   <th>제목</th>
   <th>작성일</th>
   <th>작성자</th>
   <th>조회수</th>
  </tr>
 </thead>
 
 <tbody>
  <c:forEach items="${list}" var="list">
  
  <tr onclick="location.href='/board/view?bno=${list.bno}'">
  <td>${list.bno}</td>
  <td>${list.title}</td>
  <td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
  <td>${list.writer}</td>
  <td>${list.viewCnt}</td>
 </tr>
</c:forEach>
 </tbody>
</table>
<div>
	
	<c:if test="${prev}">
		<span>[ <a href="/board/listPage?num=${startPageNum - 1}">이전</a> ]</span>
	</c:if>
	
	<c:forEach begin="${startPageNum}" end="${endPageNum}" var="num">
  		<span>
  		
  			<c:if test="${select != num}">
  				<a href="/board/listPage?num=${num}">${num}</a>
  			</c:if> 			
  			
  			<c:if test="${select == num}">
  				<b>${num}</b>
  			</c:if>
  			
		</span>
	</c:forEach>
	
	<c:if test="${next}">
		<span>[ <a href="/board/listPage?num=${endPageNum + 1}">다음</a> ]</span>
	</c:if>
	
</div>
<button type="button" onclick="location.href='/board/write'">글쓰기</button>
</body>
</html>