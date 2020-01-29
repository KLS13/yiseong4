<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
h4{
color: #969696;
}
.txt{
	font-style: normal;
	font-size: 21px;
}
.txt-info{
	font-style: normal;
	font-size: 21px;
	color : #2677de;
}
.userpoint {
	background-color: #DDDDDD;
}

.container{
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}
.imgUpload{
	width:550px;
	height : 550px;
}
.goodsPic{
	width: 550px;
	height : 550px;
	float : left;
	position: relative;
	margin-right: 35px;
}
.goodsDes{
	width : 610px;
	heifht : 550px;
	float : right;
	position: relative;
}

.gdetail li:nth-child(odd) {
	float : left;
	font-weight:bold;
}

.gdetail ul {
	list-style: none;
}
.gdetail ul{
	width: 1200px;
}

.gdetail ul li{
    padding: 10px 0 10px 10px;
    margin-bottom: 5px;
    border-bottom: 1px solid #efefef;
    font-size: 18px;
}
.gdetail{
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}

.goodsDes ul li{
	 
	 list-style: none;
}

.goodsDes li:nth-child(1) {
	margin-bottom: -20px;
}
.goodsDes li:nth-child(3) {
	margin-bottom: 70px;
}
.goodsDes li:nth-child(4) {
	margin-bottom: 20px;
}
.goodsDes li:nth-child(5) {
	margin-bottom: 33px;
}
.goodsDes li:nth-child(6) {
	margin-bottom: 33px;
}
.goodsDes li:nth-child(7) {
	margin-bottom: 33px;
}
</style>
</head>
<body>
<div class="container">
	<div class="goodsPic">
	<img src="${pageContext.request.contextPath}/${gdto.gImage}"
	class="imgUpload" >
	</div>
	
	<div class="goodsDes">
	<ul>
		<li><h1>${gdto.gName}</h1></li>
		<li><h4>
		상품 번호(${gdto.gIdx }) <br />
		상품 재고(${gdto.gQuantity }개)
		</h4></li>
		<li><h1>${gdto.gPrice }point</h1></li>
		
		<li><em class="txt">택배 - </em>
			<em class="txt-info">무료배송</em>
		</li>
		<li><em class="txt">상태 - </em>
			<c:if test="${gdto.gState eq 1}">
			<em class="txt-info">구매가능</em>
			</c:if>
			<c:if test="${gdto.gState ne 1}">
			<em class="txt-info">품절상품</em>
			</c:if>
		</li>
		<li><em class="txt">※ 각 상품별 원산지는 상세설명 참조 </em></li>
		
		<li class="userpoint">
		<em class="txt">구매 후 회원님의 남는 포인트</em><br />
		<em class="txt-info">session포인트 - 가격 예정</em>
		</li>
		<c:if test="${gdto.gState eq 1}">
		<li><input type="button" value="바로구매" onclick="location.href='goodsPayPage?gIdx=${gdto.gIdx}'"/><br />
			이미지 버튼으로 수정 
		<li>
		</c:if>
	</ul>
	</div>
	
	</div>
	<br />
	<br />
	<br />
	
	<div class="gdetail">
	<ul>
	<c:forTokens items="${gdto.gDetail}" delims="," var="gdes1">
	<c:forTokens items="${gdes1}" delims=":" var="gdes2">
	<li>
	<span>${gdes2} &nbsp;&nbsp;&nbsp;</span>
	</li>
	</c:forTokens>
	</c:forTokens>
	</ul>
	</div>
</body>
</html>