<%@page import="bean.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="joinBean" class="bean.dto.MemberDto"></jsp:useBean>
	<jsp:setProperty property="*" name="joinBean"/>
	<h3>
	아이디 : <jsp:getProperty property="id" name="joinBean"/> <br />
	비밀번호 : <jsp:getProperty property="pw" name="joinBean"/><br />
	이름 : <%= joinBean.getName() %> <br /> <!-- 위에와 같은것  다른 방식~ -->
	나이 : <%= joinBean.getAge() %><br />
	주소 : <%= joinBean.getAddr() %><br />
	성별 : <%= joinBean.getGender() %><br />
	취미 :
		<% for( String arr : joinBean.getHobbies() ) { 
			out.print(arr);
		 } %> 
			<br />
	좋아하는 음식 : <jsp:getProperty property="like" name="joinBean"/><br />
	싫어하는 음식 : <% for( String arr : joinBean.getHate() ) { 
			out.print(arr);
		 } %> 
		 <br />
	
	</h3>
</body>
</html>