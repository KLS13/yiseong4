<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style type="text/css">
table {
	border-collapse: collapse;
}
</style>
</head>
<body>

	${loginDto.mId }(${loginDto.mName})님 반갑습니다.

	<h1>구매하는 곳 입니다.</h1>
	보유 포인트 : ${loginDto.mPoint}점 입니다.
	<br /> 사용 가능 포인트 : ${loginDto.mPoint}


	<div>
		<table border="1">
			<thead>
				<tr>
					<th>상품명</th>
					<th>재고</th>
					<th>가격</th>
					<th>교환하기</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="3">상품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.item}</td>
								<td><c:if test="${list.ea gt 0}">
									${list.ea}개 
								</c:if> <c:if test="${list.ea eq 0 }">
									재고없음
								</c:if></td>
								<td>${list.price}</td>
								<td><c:if test="${list.ea gt 0 && loginDto.mPoint gt list.price}">
										<input type="button" value="교환하기"
											onclick="location.href='/26_mvc_member/buy.do?item=${list.item}&price=${list.price}&mId=${loginDto.mId}'">
									</c:if> <c:if test="${list.ea eq 0 }">
										<input type="button" value="품절상품">
									</c:if>
									<c:if test="${list.ea gt 0 && loginDto.mPoint le list.price}">
										잔액부족
									</c:if>
									</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>