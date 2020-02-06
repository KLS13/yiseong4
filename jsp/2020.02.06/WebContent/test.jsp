<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	int result = 0;
	String sql = null;
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "james";
	String password = "bond";
	conn = DriverManager.getConnection(url, user, password);
	sql = "create table customer(" + 
			"id varchar2(50) not null primary key ," +
			"pw varchar2(50) not null," +
			"name varchar2(50)," +
			"contact varchar2(50)," +
			"grade varchar2(50), " +
			"reg_date date" +
			")";
	ps = conn.prepareStatement(sql);
	rs = ps.executeQuery();
	PageContext.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result ne -1 }">
		<script type="text/javascript">
			alert("customer 테이블이 정상적으로 생성되었습니다");
			location.href = "index.jsp?result=${result}";
		</script>
	<c:if>
</body>
</html>