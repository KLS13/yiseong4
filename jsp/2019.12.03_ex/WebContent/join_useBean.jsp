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
	<jsp:useBean id="bean" class="bean.dto.Person"></jsp:useBean>
	<jsp:setProperty property="*" name="bean"/>
	
	<h3>
	아이디 : <%= bean.getId() %> <br />
	비밀번호 : <%= bean.getPw1() %> <br />
	<% if(bean.getPw1() == bean.getPw2()) {
		out.print("비밀번호 일치");
		}else {
		out.print("비밀번호가 일치하지 않습니다.");
		} %> <br />
	이름 : <%= bean.getName() %> <br />
	성별 : <%= bean.getGender() %> <br />

	연락처 : <%= bean.getPhone() %>-<%= bean.getPhone2() %>-<%= bean.getPhone3() %> <br />
	이메일 : <%= bean.getEmail() %>@<%= bean.getDomain() %>
	
	<br />
	
	<a href="join.jsp">회원가입으로 돌아가기</a>
	
	</h3>
</body>
</html>