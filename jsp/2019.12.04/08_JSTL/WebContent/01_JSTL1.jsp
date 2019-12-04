<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%-- "지시어는 상단에" JSTL 의 core 라이브러리 사용을 위한 taglib 지시어 작성 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 변수 선언 --%>
	<c:set var="num1" value="77"/>
	<c:set var="num2" value="9" />
	<c:set var="result" value="${num1+num2}" />
	
	<%-- 결과  --%>
	${num1} + ${num2} = ${result} <br />
	
	<c:out value="${num1}" /> + <c:out value="${num2}"/> = <c:out value="${result}"/>
</body>
</html>