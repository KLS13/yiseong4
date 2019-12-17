<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// 댓글이 달린 게시물을 삭제하려고 하면 예외가 발생한다.
	// try - catch 처리를 해야 한다.

	boolean isError = false;
	int result = 0;

	try {
		request.setCharacterEncoding("utf-8");
		String b_idx = request.getParameter("b_idx");
		
		BDao bdao = BDao.getInstance();
		result = bdao.getRemove(Integer.parseInt(b_idx));
	} catch (Exception e) {
		isError = true;
	}
	
	pageContext.setAttribute("result", result);
	pageContext.setAttribute("isError", isError);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result gt 0 }">
		<script type="text/javascript">
			alert("정상적으로 삭제되었습니다.");
			location.href = "index.jsp";
		</script>
	</c:if>
	<c:if test="${result eq 0 }">
		<script type="text/javascript">
			alert("게시물이 삭제되지 않았습니다.");
			history.back();
		</script>
	</c:if>
	<c:if test="${isError eq true }">
		<script type="text/javascript">
			alert("댓글이 달린 게시물은 삭제할 수 없습니다. 댓글을 먼저 삭제하세요.");
			history.go(-2);	// 2단계 전(remove_page.jsp -> view.jsp)
		</script>
	</c:if>
</body>
</html>