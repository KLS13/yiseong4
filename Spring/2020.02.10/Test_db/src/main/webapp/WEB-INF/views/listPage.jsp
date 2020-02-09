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
<c:if test="${empty list }">
비어잇다
</c:if>
<c:if test="${!empty list }">
<table border="1">
<c:forEach var="dto" items="${list}">
<tr>
	<td><a onclick="location.href='viewPage?mIdx=${dto.mIdx}'">${dto.mIdx }</a></td>
	<td>${dto.mName }</td>
</tr>
</c:forEach>
</c:if>
<td colspan="2"><input type="button" value="등록" onclick="location.href='writePage'"/></td>
</table>
</body>
</html>