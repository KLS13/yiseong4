<%@page import="com.koreait.common.CharsetEncoding"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String[] hobbies = request.getParameterValues("hobbies");
	String etc = request.getParameter("etc");
	String addr = request.getParameter("addr");
	String[] foods = request.getParameterValues("foods");
	String nickname = request.getParameter("nickname");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>parameter 받기</title>
</head>
<body>
	<ul>
		<!-- name에 CharsetEncoding 클래스의 toHangul() 메소드 적용해서 인코딩하기 -->
		<li>이름 : <%=name %></li>
		<li>나이 : <%=age %></li>
		<li>전화 : <%=tel %></li>
		<li>성별 : <%=gender %></li>
		<li>
			취미 : 
			<% for (String hobby : hobbies)	{ %>
				<%=hobby %>&nbsp;
				<% if ( etc != null ) { %>
					<%=etc %>
				<% } %>
			<% } %>
		</li>
		<li>주소 : <%=addr %></li>
		<li>
			좋아하는 음식 : 
			<% for (String food : foods) { %>
				<%=food %>&nbsp;
			<% } %>
		</li>
		<li>별명 : <%=nickname %></li>
	</ul>
</body>
</html>