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
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list}" varStatus="k">
				<c:choose>
					<c:when test="${empty list}">
						<tr>
							<td colspan="7">가입된 회원이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${k.index +1 }</td> <!-- k.count 카운트개념 -->
							<td>${dto.mId}</td>
							<td>${dto.mName}</td>
							<td>${dto.mEmail}</td>
							<td>${dto.mPhone}</td>
							<td>${dto.mAddress}</td>
							<td>${dto.mRegDate}</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</tbody>
	</table>
</form>