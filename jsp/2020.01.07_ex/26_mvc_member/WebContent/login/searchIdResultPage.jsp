<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
	<c:when test="${mDto eq null}">
		<script>
			alert("일치하는 회원 정보가 없습니다.");
			history.back();
		</script>
	</c:when>
	<c:otherwise>
		<script>
			var id = "${mDto.mId}";
			alert("회원님의 아이디는 " + id + "입니다.");
			location.href = "/26_mvc_member/loginPage.do";
		</script>
	</c:otherwise>
</c:choose>