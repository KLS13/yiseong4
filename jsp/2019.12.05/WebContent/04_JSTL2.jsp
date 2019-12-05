<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- JSTL 을 이용해서 변수생성하기(average) --%>
	<c:set var="avg" value="${(param.kor + param.eng + param.mat) / 3}"/>
	
	<%-- JSTL 을 이용해서 변수(pass) 생성 --%>
	<c:if test="${avg ge 60 }">
		<c:set var="pass" value="합격"/>
	</c:if>
	<c:if test="${avg lt 60 }">
		<c:set var="pass" value="불합격" />
	</c:if>
	
	<%-- JSTL 을 이용해서 변수(grade) 생성 --%>
	
	<c:choose>
		<c:when test="${avg ge 90}"><c:set var="grade" value="A"/></c:when>
		<c:when test="${avg ge 80}"><c:set var="grade" value="B"/></c:when>
		<c:when test="${avg ge 70}"><c:set var="grade" value="C"/></c:when>
		<c:when test="${avg ge 60}"><c:set var="grade" value="D"/></c:when>
		<c:otherwise><c:set var="grade" value="F"/></c:otherwise>
	</c:choose>
	<h1>성적 처리 결과</h1>
	<ul>
		<li>국어 : ${param.kor}</li>
		<li>영어 : ${param.eng}</li>
		<li>수학 : ${param.mat}</li>
		<li>평균 : ${avg}</li>
		<li><c:if test="${param.kor gt param.eng }">
		국어 점수가 영어점수보다 ${param.kor - param.eng }점 더 높습니다.
		</c:if>
		</li>
		<li>학점 : ${grade}</li>
		<li>결과 : ${pass}</li>
	</ul>
	
</body>
</html>