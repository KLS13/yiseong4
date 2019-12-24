<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${result gt 0 }">
	<script type="text/javascript">
		alert("게시글을 등록했습니다.");
		location.href = "/25_mvc_bbs/list.do";
	</script>
</c:if>
<c:if test="${result eq 0 }">
	<script type="text/javascript">
		alert("게시글이 등록되지 않았습니다. 다시 시도하세요.");
		location.href = "/25_mvc_bbs/insertBBSPage.do";
	</script>
</c:if>