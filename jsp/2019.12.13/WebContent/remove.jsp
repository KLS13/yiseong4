<%@page import="com.koreait.mybatis.GuestbookDao"%>
<%@page import="com.koreait.mybatis.GuestbookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	request.setCharacterEncoding("utf-8");
	int result = GuestbookDao.removeByIdx( Integer.parseInt(request.getParameter("idx")) );
	pageContext.setAttribute("result", result);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${result gt 0 }">
			<script type="text/javascript">
				alert("방명록이 정상적으로 삭제되었습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("방명록이 정상적으로 삭제되지 않았습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>