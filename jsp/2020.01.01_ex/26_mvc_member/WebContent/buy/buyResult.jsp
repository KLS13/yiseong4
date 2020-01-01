<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${result gt 0}">
		<script>
		alert("구매완료");
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("구매실패");
		</script>
	</c:otherwise>
</c:choose>

${loginDto.mId} 님 안녕하세요 <br />
${loginDto.mPoint}점 보유하고 있습니다. <br />

<h1>구매내역</h1> <br />
${item} 구매완료 <br />
구매 포인트 : ${mDto.mPoint}점 <br />

${loginDto.mPoint} - ${mDto.mPoint} = ${loginDto.mPoint - mDto.mPoint}점
