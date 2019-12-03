<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="04_useBean2.jsp">
		아디 <input type="text" name="id"/> <br />
		비번 <input type="text" name="pw"/> <br />
		이름 <input type="text" name="name" /> <br />
		나이 <input type="text" name="age" /> <br />
		주소 <input type="text" name="addr" /> <br />
		성별 <input type="radio" name="gender" value="남자" /> 남
		   <input type="radio" name="gender" value="여자" /> 여
		   <br /><br />
		취미 <input type="checkbox" name="hobbies" value="수영" /> 수영
		   <input type="checkbox" name="hobbies" value="독서" /> 독서
		   <input type="checkbox" name="hobbies" value="미드" /> 미드
		   <input type="checkbox" name="hobbies" value="게임" /> 게임
		<br /><br />
		좋아하는 음식
		<select name=like>
			<option value="순대"> 순대 </option>
			<option value="비빔밥"> 비빔밥 </option>
			<option value="김치찌개"> 김치찌개 </option>
			<option value="스테이크"> 스테이크 </option>
		</select>
		<br /><br />
		싫어하는 음식
		<br />
		<select name="hate" size="4" multiple>
			<option value="카레"> 카레 </option>
			<option value="떡볶이"> 떡볶이 </option>
			<option value="오뎅"> 오뎅 </option>
			<option value="튀김"> 튀김 </option>
		</select>
		<br />
		
		<input type="submit" value="전송" />
	</form>
</body>
</html>