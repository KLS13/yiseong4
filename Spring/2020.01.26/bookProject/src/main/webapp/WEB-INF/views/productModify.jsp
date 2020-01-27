<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.inputArea{
		margin: 10px 0;
	}
	label{
		display: inline-block;
		width : 70px;
		padding: 5px;
	}
	
	label[for='gdsDes'] {
		display: block;
	}
	
	input {
		width : 150px;
	}
	textarea#gdsDes {
	width : 400px;
	height : 180px;
	}
	
	.select_img img {
	margin : 20px 0;
	}
</style>


</head>
<body>
<h1>관리자 상품수정 페이지</h1>

<form role="form" action="productModify" method="post" autocomplete="off">

<div class="inputArea">

<input type="hidden" id="gIdx" name="gIdx" value="${pdto.gIdx }" />

 <label for="gdsName">상품명</label>
 <input type="text" id="gName" name="gName" value="${pdto.gName }"/>
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <input type="text" id="gPrice" name="gPrice" value="${pdto.gPrice}" />
</div>

<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <input type="text" id="gQuantity" name="gQuantity" value="${pdto.gQuantity}" />
</div>

<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
</div>

<div class="inputArea">
 <button type="submit" id="product_Btn">재등록</button>
</div>
</form>
</body>
</html>