<%@page import="com.koreait.mvc03.dto.PersonDto"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	// root-context.xml 에 설정된 빈처리
	// root-context.xml 에 작성된 빈은 applicationScope 를 가진다.
	WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(application);

	PersonDto human1 = ctx.getBean("person1", PersonDto.class);
	PersonDto human2 = ctx.getBean("person2", PersonDto.class); //PersonDto human2 = (PersonDto)ctx.getBean("person2");   캐스팅
	
	pageContext.setAttribute("person1", human1);
	pageContext.setAttribute("person2", human2);
	
%>

<div>
	<h3>이름 : ${person1.name}</h3>
	<h3>나이 : ${person1.age }</h3>
	<h3>연락처 : ${person1.contact.phone}</h3>
	<h3>거주지 : ${person1.contact.addr}</h3>
	<hr />
	<h3>이름 : ${person2.name}</h3>
	<h3>나이 : ${person2.age }</h3>
	<h3>연락처 : ${person2.contact.phone}</h3>
	<h3>거주지 : ${person2.contact.addr}</h3>
</div>
</body>
</html>