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
<h1>관리자 상품등록 페이지</h1>

<form role="form" action="GoodsPostPage" method="post" autocomplete="off" enctype="multipart/form-data">

<div class="inputArea">

 <label for="gName">상품명</label>
 <input type="text" id="gName" name="gName" />
</div>

<div class="inputArea">
 <label for="gPrice">상품가격</label>
 <input type="text" id="gPrice" name="gPrice" />
</div>

<div class="inputArea">
 <label for="gQuantity">상품수량</label>
 <input type="text" id="gQuantity" name="gQuantity" />
</div>


<div class="inputArea">
 <label for="gImage">상품사진</label>
 <input type="file" id="gImage" name="file" />
</div>
 
<div class="inputArea">
 <label for="gDetail">상품상세</label> <br />
 <textarea rows="5" cols="50" id="gDetail" name="gDetail">
 </textarea>
</div>

저장 경로 체크 : <%=request.getRealPath("/") %>
<div class="inputArea">
 <input type="submit" id="product_Btn" value="등록" />
</div>
</form>
</body>
</html>