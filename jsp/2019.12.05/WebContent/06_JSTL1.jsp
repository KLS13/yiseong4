<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="06_JSTL2.jsp">
		<h3> 일반 forEach </h3>
		최소 크기 : <input type="number" name="num1" min="1" max="7"/> <br />
		최대 크기 : <input type="number" name="num2" min="1" max="7"/> <br /> <br />
		
		<h3> 향상 forEach </h3>
		<input type="checkbox" name="foods" value="불고기" /> 불고기 &nbsp;
		<input type="checkbox" name="foods" value="삼겹살" /> 삼겹살 &nbsp;
		<input type="checkbox" name="foods" value="김치찌개" /> 김치찌개 &nbsp;
		<input type="checkbox" name="foods" value="떡볶이" /> 떡볶이 &nbsp;
		<input type="checkbox" name="foods" value="순대국" /> 순대국 &nbsp;

		<br /><br />
				
		<input type="submit" value="전송" />
		<input type="reset" value="취소" />
		
	</form>	
		
</body>
</html>