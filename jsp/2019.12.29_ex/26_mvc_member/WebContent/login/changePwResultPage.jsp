<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${result eq 0 }">
		<script type="text/javascript">
			alert("패스워드가 변경되지 않았습니다. 다시 시도하세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("새로운 패스워드가 설정되었습니다.");
			location.href = "/26_mvc_member/loginPage.do";
		</script>
	</c:otherwise>
</c:choose>