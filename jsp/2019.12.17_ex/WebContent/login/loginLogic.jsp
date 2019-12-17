<%@page import="java.util.List"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@page import="com.koreait.mybatis.JDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String writer = request.getParameter("writer");
	String pw = request.getParameter("pw");
	
	JDto jdto = new JDto();
	BDao bdao = BDao.getInstance();
	List<JDto> list = bdao.getLogin(jdto);
	
	if(list.size() > 0) {
		request.getRequestDispatcher("/2019.12.17_ex/index.jsp").forward(request, response);
	}else {
%> <script type="text/javascript">
		history.back();
	</script>
	<% } %>

	
</body>
</html>