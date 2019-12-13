<%@page import="com.koreait.mybatis.GuestbookDao"%>
<%@page import="com.koreait.mybatis.GuestbookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	request.setCharacterEncoding("utf-8");
	GuestbookDto dto = new GuestbookDto();
	dto.setIdx( Integer.parseInt(request.getParameter("idx")) );
	dto.setWriter( request.getParameter("writer") );
	dto.setEmail( request.getParameter("email") );
	dto.setPw( request.getParameter("pw") );
	dto.setTitle( request.getParameter("title") );
	dto.setContent( request.getParameter("content") );
	
	int result = GuestbookDao.updateByIdx(dto);
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
				alert("방명록이 정상적으로 수정되었습니다.");
				// location.href = "view.jsp?idx=${dto.idx}";	c:redirect 태그로 처리할 수도 있다.
			</script>
			<c:redirect url="view.jsp">
				<c:param name="idx" value="${dto.idx }" />
			</c:redirect>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("방명록이 정상적으로 수정되지 않았습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>