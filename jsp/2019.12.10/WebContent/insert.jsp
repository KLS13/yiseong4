<%@page import="com.koreait.db.GreenDao"%>
<%@page import="com.koreait.db.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
%>

<%-- <% GreenDto dto = new GreenDto(); %>  아래 부분과 같은 것임.--%>
<jsp:useBean id="dto" class="com.koreait.db.GreenDto"></jsp:useBean>

<%--
String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");

	GreenDto dto = new GreenDto();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setAge(Integer.parseInt(age));
	dto.setAddr(addr);
 아래 부분과 같은 것임.--%>
<jsp:setProperty property="*" name="dto" />

	<%	
		GreenDao dao = GreenDao.getInstance();
		int result = dao.getInsert(dto);
	%>
	
	<%
		if(result > 0) {
			response.sendRedirect("view_all.jsp");
		}else { %>
			<script>
				alert("회원 가입 실패");
				history.go(-1);
				</script>
		<%}%>
