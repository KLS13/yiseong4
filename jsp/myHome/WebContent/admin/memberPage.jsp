<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="회원관리 페이지" name="title" />
</jsp:include>

<form>
	<table>
		<thead>
			<tr>
				<td>번호</td>
				<td>아이디</td>
				<td>성명</td>
				<td>이메일</td>
				<td>전화번호</td>
				<td>주소</td>
				<td>가입일</td>
				<td>최근 로그인 날짜</td>
				<td>보유 포인트</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="mDto" items="${list }" varStatus="k">
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="9">가입된 회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${k.index + 1 }</td><!-- ${k.count } -->
							<td><a href="/myHome/memberUpdate.ad?mId=${mDto.mId }">${mDto.mId }</a></td>
							<td>${mDto.mName }</td>
							<td>${mDto.mEmail }</td>
							<td>${mDto.mPhone }</td>
							<td>${mDto.mAddress }</td>
							<td>${mDto.mRegDate }</td>
							<td>${mDto.mLogin }</td>
							<td>${mDto.mPoint }</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
</form>

<%@ include file="/layout/footer.jsp" %>