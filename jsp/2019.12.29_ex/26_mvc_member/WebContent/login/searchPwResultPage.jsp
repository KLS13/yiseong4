<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:choose>
	<c:when test="${mDto eq null }">
		<script type="text/javascript">
			alert("일치하는 회원 정보가 없습니다. 다시 시도하세요.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script type="text/javascript">
			var id = "${mDto.mId }";
			alert(id + "님이 사용할 새로운 패스워드를 설정하세요.");
			location.href = "/26_mvc_member/changePwPage.do";
		</script>
	</c:otherwise>
</c:choose>