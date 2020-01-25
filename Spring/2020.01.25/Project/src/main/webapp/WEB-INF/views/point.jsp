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

<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">

<div class="inputArea">

 <label for="gdsName">상품명</label>
 <input type="text" id="gdsName" name="gdsName" />
</div>

<div class="inputArea">
 <label for="gdsPrice">상품가격</label>
 <input type="text" id="gdsPrice" name="gdsPrice" />
</div>

<div class="inputArea">
 <label for="gdsStock">상품수량</label>
 <input type="text" id="gdsStock" name="gdsStock" />
</div>

<div class="inputArea">
 <label for="gdsDes">상품소개</label>
 <textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
</div>

<div class="inputArea">
 <label for="gdsImg">이미지</label>
 <input type="file" id="gdsImg" name="file" />
 <div class="select_img"><img src="" />
 </div>

 <script>
  $("#gdsImg").change(function(){
   if(this.files && this.files[0]) {
    var reader = new FileReader;
    reader.onload = function(data) {
     $(".select_img img").attr("src", data.target.result).width(500);        
    }
    reader.readAsDataURL(this.files[0]);
   }
  });
 </script>
</div>
<div class="inputArea">
 <button type="submit" id="product_Btn" class="product">등록</button>
</div>
</form>
</body>
</html>