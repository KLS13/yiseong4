<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script type="text/javascript">
</script>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		session.setAttribute("ID", id);
		
	%>
		<h1><%=session.getAttribute("ID") %>님 환영합니다.</h1>
		<h1>${ID}님의 구매 가능 목록</h1>
	<form action="cart1.jsp">
	
		<h1> 상품선택 </h1>
		<select name="product">
			<option value="선택">::상품선택::</option>
			<option value="포도">포도</option>
			<option value="사과">사과</option>
			<option value="자두">자두</option>
			<option value="참외">참외</option>
			<option value="망고">망고</option>
		</select>
		<input type="submit" value="추가" /> 
		<input type="button" value="구매" onclick="location.href='cart2.jsp'" /> 
		<input type="button" value="로그아웃" onclick="location.href='cart3.jsp'" />
		
		</form>
</body>
</html>