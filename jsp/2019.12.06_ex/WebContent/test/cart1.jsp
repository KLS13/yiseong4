<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	
	// 1. CART 에 추가할 product
	String product = request.getParameter("product");
	
	// 2. session 에 있는 CART 가져오기
	// cart 는 session 에 있는 CART 참조값 (주소값)
	ArrayList<String> cart = (ArrayList<String>)session.getAttribute("CART");
	
	// 3. cart 가 없다면 : 첫 제품의 추가
	// 해야 할일 : CART 만들고, session 에 올리기
	if( cart == null ) {
		cart = new ArrayList<String>();
		session.setAttribute("CART", cart); // 배열을 통쨰로 올림
	}
	
	// 4. 무조건 하는 작업
	cart.add(product);
%>
    
<script type="text/javascript">
	alert("<%=product%>이(가) 장바구니에 추가되었습니다.");
	history.back();
</script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>