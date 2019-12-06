<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제화면</title>
</head>
<body>
	<h1>결제 화면</h1>
	<br />
	<h3>장바구니 목록</h3>
	<%
		ArrayList<String> cart = (ArrayList<String>)session.getAttribute("CART");
	
		if(cart == null) {
			out.println("<h3>장바구니가 비었습니다.</h3>");
			
		}else {
			out.println("<ul>");
			for( int i = 0; i < cart.size(); i++) {
				out.println("<li>" +cart.get(i)+"</li>");
			}
			out.println("-------------------------------------");
			for(String product : cart) {
					out.println("<li>" + product+ "</li>");
			}
			out.println("</ul>");
		}
	%>
</body>
</html>