<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>결제페이지 test</h1>


<h3>
상품번호 : ${gdto.gIdx } <br />
상품명 : ${gdto.gName } <br />
포인트 : ${gdto.gPrice } 차감
</h3>

<h4>
1. 유저 정보 및 배송지 확인 <br />
2. 결제확정 -->  유저 포인트 차감, 세션 초기화, 상품 재고수량 1개감소 <br />
3. 
</h4>
</body>
</html>