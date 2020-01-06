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
<jsp:include page="/template/header.jsp" />

<div>
${loginDto.mId} 님 안녕하세요 <br />

<h1>구매내역</h1> <br />
${item} 구매완료 <br />
구매 포인트 : ${mDto.mPoint}점 <br />

${mDto.mPoint}차감되었습니다. <br /> 현재 보유 포인트는 ${loginDto.mPoint}점 <br /><br />

<input type="button" value="홈으로 넘어가기" onclick="location.href='index.jsp'">
</div>
<%@ include file="/template/footer.jsp" %> <!-- 파라미터 전달 불가(정적 포함) -->