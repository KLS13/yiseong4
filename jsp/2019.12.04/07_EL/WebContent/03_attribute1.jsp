<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1~100 사이 홀수 합</title>
</head>
<body>
	<%
		int oddTotal = 0;
		for( int n = 1; n<=100; n++) {
			if( n % 2 == 1 ) {
				oddTotal += n;
			}
		}
		
		//세션에 결과를 저장하자.
		session.setAttribute("ODD", new Integer(oddTotal));
	%>
</body>
</html>