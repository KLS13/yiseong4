<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1~100 사이 짝수 합</title>
</head>
<body>
	<%
		int evenTotal = 0;
		for ( int n = 1 ; n<=100; n++) {
			if(n%2 == 0) {
				evenTotal += n;
			}
		}
		// 다른 페이지로 결과를 전달하기 위해 request 영역에 저장하자.
		request.setAttribute("EVEN", new Integer(evenTotal));
		
		//시스템의 변화가 없는 상태에서 이동하는 경우 "포워드" 한다.
		request.getRequestDispatcher("02_attribute2.jsp").forward(request, response);
	
	%>
	
</body>
</html>