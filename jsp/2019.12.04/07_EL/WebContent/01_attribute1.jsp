<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1 ~ 100까지 합 구하기</title>
</head>
<body>
	<%
		int total = 0;
		for( int n = 1; n<=100; n++) {
			total += n;
		}
		
		// 결과 total 을 pageContext 영역에 저장
		pageContext.setAttribute("TOTAL", new Integer(total));	
	%>
	<h1> 1 ~ 100 사이의 모든 정수 합은 <%= pageContext.getAttribute("TOTAL") %> </h1>
</body>
</html>