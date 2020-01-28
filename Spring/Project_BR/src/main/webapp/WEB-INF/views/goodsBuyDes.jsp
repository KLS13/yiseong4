<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.imgUpload{
	width:300px;
	height:300px;
}
div{
	float : right;
	position: relative;
	margin-top:200px;
	margin-right:100px;
}
table{
	border-collapse: collapse;
	width:600px;
	height:600px;
}
td{
	text-align: center;
}
</style>
</head>
<body>
<div>
<table border="1">
	<tr>
		<th colspan="2">${gdto.gName} 상세보기</th>
	</tr>
	<tr>
		<td rowspan="5">
		<img src="${pageContext.request.contextPath}/${gdto.gImage}"
		class="imgUpload">
		</td>
		<td>제품명 : ${gdto.gName}</td>
	</tr>
	<tr>
		<td>포인트 : ${gdto.gPrice}</td>
	</tr>
	<tr>
		<td>재고 : ${gdto.gQuantity}</td>
	</tr>
	<tr>
		<td>
	    	<c:if test="${gdto.gState eq 1}">
				상태 : 구매가능
			</c:if>  
		</td>
	</tr>
	<tr>
		<td><input type="button" value="구매하기" onclick="location.href='goodsBuyCheck'" /> </td>
	</tr>
	<tr>
		<td colspan="2">상품등록일 : ${gdto.gDate }</td>
	</tr>
	</table>
	</div>
	<br />
	<br />
	<br />

</body>
</html>