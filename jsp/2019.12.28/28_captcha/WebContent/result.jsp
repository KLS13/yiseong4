<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${result eq true }">
		<script type="text/javascript">
			alert("성공");
			location.href = "/28_captcha/getImage.do";
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			alert("실패");
			location.href = "/28_captcha/getImage.do";
		</script>
	</c:otherwise>
</c:choose>