<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="n" value="123456789.123456789"/>
	천단위 구분 기호 + 소수점 3자리 : <fmt:formatNumber value="${n}" />  <br />
	천단위 구분 기호 없이 소수 3자리 : <fmt:formatNumber value="${n}" groupingUsed="false" /> <br />
	천단위 구분 기호 + 소수 2자리    : <fmt:formatNumber value="${n}" pattern="#,##0.00" /> <br />
	천단위 구분 기호 + 소수 1자리    : <fmt:formatNumber value="${n}" pattern="#,##0.0" /> <br />
	천단위 구분 기호 + 정수 : <fmt:formatNumber value="${n}" pattern="#,##0" /> <br />
	
	퍼센트 기호 : <fmt:formatNumber value="0.1" type="percent"/> <br />
	원화 표기  : <fmt:formatNumber value="${n}" type="currency"/> <br />
	달러 표시  : <fmt:formatNumber value="${n}" type="currency" currencySymbol="$"/> <br />
</body>
</html>