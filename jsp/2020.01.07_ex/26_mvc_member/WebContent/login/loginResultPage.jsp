<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${loginDto eq null}">
		<script>
			alert("일치하는 회원 정보가 없습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			var id="${loginDto.mId}";
			alert(id + "님 로그인 되었습니다.");
			location.href = "/26_mvc_member/index.do";
		</script>
	</c:otherwise>
</c:choose>