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
	width: 300px;
	height: 300px;
}

</style>
</head>
<body>
	<table border="1">
		<tr>
			<th>상품사진</th>
			<th>상품번호</th>
			<th>상품이름</th>
			<th>상품수량</th>
			<th>상품가격</th>
		</tr>
<c:if test="${empty list}">
<tr>
	<td>
	상품이 없습니다.
	</td>
</tr>
</c:if>

		<c:if test="${not empty list }">
		
			<c:forEach var="pdto" items="${list}">
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/imgUpload/${pdto.gImage}" />
					</td>
					<td>${pdto.gIdx }</td>
					<td>${pdto.gName }</td>
					<td>${pdto.gQuantity }개</td>
					<td>${pdto.gPrice }point</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</body>
</html>