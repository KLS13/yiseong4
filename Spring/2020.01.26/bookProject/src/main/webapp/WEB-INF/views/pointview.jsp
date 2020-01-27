<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	border-collapse: collapse;
}

.imgUpload {
	width: 200px;
	height: 200px;
	margin: 20px;
}
</style>
</head>
<body>
<h1> 유저의 아이디와 포인트 정보 + 교환목록으로 이동하기  추가 </h1>
	<form>
		<table border="1">
			<tr>
				<th>상품번호</th>
				<th>상품사진</th>
				<th>상품이름</th>
				<th>상품수량</th>
				<th>상품가격</th>
				<th>교환하기</th>
				<!-- 관리자 버튼 -->
				<th>관리자 수정</th>
				<th>관리자 삭제</th>
				<th> 비고 </th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td>상품이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty list }">

				<c:forEach var="pdto" items="${list}">
					<tr>
						<td>${pdto.gIdx }</td>
						<td><img
							src="${pageContext.request.contextPath}/${pdto.gImage}"
							class="imgUpload" ></td>
						<td>${pdto.gName }</td>
						<td>${pdto.gQuantity }개</td>
						<td>${pdto.gPrice }point</td>
						<td><input type="button" value="교환하기" onclick="location.href='ProductBuy?gIdx=${pdto.gIdx}'"></td>
						<td><input type="button" value="제품수정" onclick="location.href='ProductDes?gIdx=${pdto.gIdx}'"></td>
						<td><input type="button" value="제품삭제" onclick="location.href='ProductDelete?gIdx=${pdto.gIdx}'"></td>
						<td> 
						1.관리자만 보이게  <br />
						2.재고 0 일때 품절처리 <br />
						3.유저의 포인트 감소 <br />
						</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</body>
</html>