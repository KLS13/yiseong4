<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="/layout/header.jsp">
	<jsp:param value="회원관리 페이지" name="title" />
</jsp:include>

<form>
	<table>
		<thead>
			<tr>
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
			<c:if test="${empty mdto}">
			<tr>
				<td colspan="8">정보가 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${not empty mdto}">
			<tr>
				<td>${mdto.mId }</td>
				<td>${mdto.mName }</td>
				<td>${mdto.mEmail }</td>
				<td>${mdto.mPhone }</td>
				<td>${mdto.mAddress }</td>
				<td>${mdto.mRegDate }</td>
				<td>${mdto.mLogin }</td>
				<td>${mdto.mPoint }</td>
			</tr>
			</c:if>
		</tbody>
	</table>
</form>

<%@ include file="/layout/footer.jsp"%>