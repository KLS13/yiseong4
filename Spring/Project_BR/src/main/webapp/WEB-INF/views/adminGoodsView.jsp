<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.imgUpload {
	width: 200px;
	height: 200px;
	margin: 20px;
}
body { background: #fff; }
.listtable {
  border-collapse: collapse;
}  
.listtable th {
  padding: 10px;
  color: #168;
  border-bottom: 3px solid #168;
}
.listtable td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
   text-align: center;
}
.listtable tr:hover td {
  color: #004;
}

</style>
</head>
<body>
<h1> 관리자용 </h1>
	<form>
		<table border="1" class="listtable">
			<tr>
				<th>상품번호</th>
				<th>상품사진</th>
				<th>상품이름</th>
				<th>상품수량</th>
				<th>상품가격</th>
				<!-- 관리자 버튼 -->
				<th>관리자 수정</th>
				<th>관리자 삭제</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td>상품이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty list }">

				<c:forEach var="gdto" items="${list}">
					<tr>
						<td>${gdto.gIdx }</td>
						<td><img
							src="${pageContext.request.contextPath}/${gdto.gImage}"
							class="imgUpload" ></td>
						<td>${gdto.gName }</td>
						<td>${gdto.gQuantity }개</td>
						<td>${gdto.gPrice }point</td>
						<td><input type="button" value="제품수정" onclick="location.href='adminGoodsModifyPage?gIdx=${gdto.gIdx}'"></td>
						<td><input type="button" value="제품삭제"
							onclick="location.href='adminGoodsDeletePage?gIdx=${gdto.gIdx }'"/></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
</body>
</html>