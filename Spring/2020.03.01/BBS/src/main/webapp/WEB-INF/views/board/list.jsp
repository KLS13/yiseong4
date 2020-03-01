<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
 <tr>
  <td>${list.bno}</td>
  <td>${list.title}</td>
  <td>${list.regDate}</td>
  <td>${list.writer}</td>
  <td>${list.viewCnt}</td>
 </tr>
</c:forEach>
 </tbody>

</table>
</body>
</html>