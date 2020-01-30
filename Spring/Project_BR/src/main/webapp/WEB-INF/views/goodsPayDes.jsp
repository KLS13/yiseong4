<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.userInfo {
	width: 1200px;
	margin: 0 auto;
	overflow: hidden;
}
table {
	border-collapse: collapse;
	width: 1200px;
	margin-bottom: 100px;
	border-color: #969696;
}
tr td {
	padding: 10px;
	}
	
tr :nth-child(1) {
	font-weight: bold;
}
.imgUpload {
	width: 230px;
	height: 250px;
	margin-right: 20px;
}

.goodsInfo {
	width : 950px;
}
.pay-btn {
	border: 0px;
	background-color: white;
}
.pay-btn :hover{
	cursor: pointer;
}
.cancel-btn {
	border: 0px;
	background-color: white;
}
.cancel-btn :hover{
	cursor: pointer;
}
.icon_care{
	width:22px;
	height:22px;
}

</style>
</head>
<body>
<form action="payDecision" method="POST">


<div class="userInfo">
<h1 align="center">결제요청 페이지</h1>
<br /><br /><br />
<h1>회원정보</h1>
<table border = "2">
	<tr>
		<td>고객 아이디</td>
		<td>sessionScope.로그인 ID</td>
	</tr>
	<tr>
		<td>고객 이름</td>
		<td>sessionScope.로그인 NAME</td>
	</tr>
	<tr>
		<td>고객 전화번호</td>
		<td>sessionScope.로그인 phone</td>
	</tr>
	<tr>
		<td>보유 포인트</td>
		<td>sessionScope.로그인정보 POINT</td>
	</tr>
	<tr>
		<td>고객 배송지</td>
		<td>인풋태그 : 수정할수 있도록  : sessionScope.로그인정보 ADDR</td>
	</tr>
	<tr>
		<td><img src="images/경고.png" align="left" class="icon_care"/>&nbsp;배송 유의사항</td>
		<td>
		※주문자의 배송지정보 오입력으로 인한 배송문제는 "프로젝트명"에서 책임지지 않습니다.
		</td>
	</tr>
</table>

	<h1>구매 상품 정보</h1>
			<img src="${pageContext.request.contextPath}/${gdto.gImage}"
			align="left" class="imgUpload" >
	<table border = "2" class="goodsInfo">
	<tr>
		<td>상품 번호</td>
		<td>${gdto.gIdx }</td>
	</tr>
	<tr>
		<td>상품 이름</td>
		<td>${gdto.gName }
		</td>
	</tr>
	<tr>
		<td>필요 포인트</td>
		<td>${gdto.gPrice }point</td>
	</tr>
	<tr>
		<td>결제방식</td>
		<td>포인트 결제</td>
	</tr>
	<tr>
		<td>배송유형</td>
		<td>택배 - 무료배송</td>
	</tr>
	<tr>
		<td><img src="images/경고.png" align="left" class="icon_care"/>&nbsp;배송 유의사항</td>
		<td>
		※주문자의 배송지정보 오입력으로 인한 배송문제는 "프로젝트명"에서 책임지지 않습니다.
		</td>
	</tr>
</table>
<p>
<h1>※포인트 교환(구매)약관 동의에 대한 안내※</h1> <br />
 <br />
①‘프로젝트명’ 이용자는 ‘프로젝트명’상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, <br />
‘프로젝트명’은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다. <br />
1.재화 등의 검색 및 선택 <br />
2.받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력 <br />
3.약관내용, 청약철회권이 제한되는 서비스, 배송료,설치비 등의 비용부담과 관련한 내용에 대한 확인 <br />
4.이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭) <br />
5.재화 등의 구매신청 및 이에 관한 확인 또는 ‘프로젝트명’의 확인에 대한 동의 <br />
<br />
②‘프로젝트명’이 제3자에게 구매자 개인정보를 제공,위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, <br />
회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 ‘프로젝트명’은 제공되는 개인정보 항목, 제공받는 자,  <br />
제공받는 자의 개인정보 이용 목적 및 보유,이용 기간 등을 구매자에게 명시하여야 합니다.<br />
다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 처리위탁의 경우 등<br />
관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다. 제10조 (계약의 성립)<br /><br />
</p>

위 내용에 동의할 시 <font style="font-weight: bold; text-decoration: underline">"결제확정"</font>버튼을 눌러주세요.

<br /><br /><br />

<button type="submit" class="pay-btn"> <img src="images/결제확정.png"/> </button>  
<button type="button" class="cancel-btn" onclick="history.back()"> <img src="images/결제취소.png"/> </button> 

<input type="hidden" id="uIdx" name="uIdx" value="로그인 세션값"/>
<input type="hidden" id="gIdx" name="gIdx" value="${gdto.gIdx }"/>
<input type="hidden" id="gPrice" name="gPrice" value="${gdto.gPrice }"/>
</div>
</form>

</body>
</html>