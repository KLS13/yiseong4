<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EL(표현언어)</title>
</head>
<body>
	<h1>이전의 jsp 표현식</h1>
	<ul>
		<li> 7 + 2 = <%= 7+2 %></li>
		<li> 7 - 2 = <%= 7-2 %></li>
		<li> 7 * 2 = <%= 7*2 %></li>
		<li> 7 / 2 = <%= 7/2 %></li>
		<li> 7 % 2 = <%= 7%2 %></li>
		
	</ul>
	
	<h1>새로운 EL 표현 언어</h1>
	<ul>
		<li> 7 + 2 = ${7+2}</li>
		<li> 7 - 2 = ${7-2}</li>
		<li> 7 * 2 = ${7*2}</li>
		<li> 7 / 2 = ${7/2}</li>
		<li> 7 % 2 = ${7%2}</li>
	</ul>
	
	<h1>이전의 JSP 변수 저장</h1>
	<% int num = 100; %>
	num 의 값 : <%= num %> <br />
	
	<h1>새로운 EL 변수 저장</h1>
	<% pageContext.setAttribute("num", new Integer(100)); %>
	num의 값 : ${num} <br />

	<h1>EL 에서 사용되는 4가지 속성의 우선 순위</h1>
	<%
		//같은 이름의 변수를 4가지 속성에 함께 저장하면
		//우선순위가 높은 변수가 사용된다.
		//우선 순위 높은 순 : pageContext > request > session > application
		
		pageContext.setAttribute("car", "s-class");
		request.setAttribute("car", "e-class");
		session.setAttribute("car", "c-class");
		application.setAttribute("car", "a-class");
		
	%>
	<ul>
		<li>그냥 호출 : ${car}  //pageContext가 사용됨. 우선순위가 높은 변수 사용.</li>
		<li>pageContext 스코프 : ${pageScope.car}</li>
		<li>request 스코프 : ${requestScope.car }</li>
		<li>session 스코프 : ${sessionScope.car }</li>
		<li>application 스코프 : ${applicationScope.car}</li>
		</ul>
	
</body>
</html>