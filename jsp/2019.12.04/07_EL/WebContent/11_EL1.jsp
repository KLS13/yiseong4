<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="11_EL2.jsp">
	<table>
		<tr>
			<td>성명 </td>
			<td><input type="text" name="name" /> </td>
		<tr>
		<tr>
			<td>나이</td>
			<td><input type="text" name="age" /></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type="radio" name="gender" value="남자"> 남 
				<input type="radio" name="gender" value="여자"> 여 
			</td>
		</tr>
		<tr>
			<td>취미</td>
			<td><input type="checkbox" name="hobbies" value="운동"> 운동
				<input type="checkbox" name="hobbies" value="여행"> 여행
				<input type="checkbox" name="hobbies" value="영화"> 영화
				<input type="checkbox" name="hobbies" value="휴식"> 휴식
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td> <select name="addr">
					<option> :: 선택 :: </option>
					<option> 경기 </option>
					<option> 인천 </option>
					<option> 서울 </option>
				 </select>
			</td>
		</tr>
		<tr>
			<td>좋아하는 음식</td>
			<td><select name="food" size="4" multiple>	
					<option> 짜장 </option>
					<option> 짬뽕 </option>
					<option> 볶음밥 </option>
					<option> 탕수육 </option>
				</select>
			</td>
		</tr>
		<tr>
			<th colspan="2"><input type="submit" value="전송"/> </th>
		</tr>
	</table>
	<br />

	</form>
</body>
</html>