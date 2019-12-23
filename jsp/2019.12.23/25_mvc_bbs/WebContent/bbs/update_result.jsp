<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${result gt 0 }">
	<script type="text/javascript">
		var b_idx = "${b_idx}";
		alert("게시글 수정완료");
		location.href = "/25_mvc_bbs/view.do?b_idx="+b_idx;
	</script>
</c:if>
<c:if test="${result eq 0 }">
	<script type="text/javascript">
		alert("게시글이 수정실패. 다시 시도하세요.");
		location.href = "/25_mvc_bbs/updateBBSPage.do";
	</script>
</c:if>