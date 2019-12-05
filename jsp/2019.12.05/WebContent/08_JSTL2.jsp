<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>formatDate</title>
</head>
<body>
	<c:set var="now" value="<%= new Date() %>"/> <%-- now 가 오늘날짜됨~ --%>
	date 타입 : <fmt:formatDate value="${now}" type="date" />  <br />
	time 타입 : <fmt:formatDate value="${now}" type="time" />  <br />
	both 타입 : <fmt:formatDate value="${now}" type="both" />  <br />
 	
 	default 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="default" timeStyle="default"/> <br />
 	short 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/> <br />
 	medium 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="medium" timeStyle="medium"/> <br />
 	long 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="long" timeStyle="long"/> <br />
 	full 스타일 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> <br />
 	
 	<%
	//년 : yy, yyyy
	//월 : M, MM
	//일 : d, dd
	//요일 : E
	//오전오후 : a
	//시 : hh(12시각) , HH(24시각)
	//분 : mm
	//초 : ss
 	%>
 	
 	사용자 패턴 : <fmt:formatDate value="${now}" pattern="yyyy년  MM월 dd일 E요일 a hh시 mm분 ss초"/>
</body>
</html>