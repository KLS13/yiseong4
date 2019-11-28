<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		f.action = "/03_jsp/04_02_receive.jsp"
		f.submit();
	}

</script>
</head>
<body>
	<h1>개인정보 전송하기</h1>
	<form method="post">
		<fieldset>
			<legend>개인정보</legend>
			<div>이름 <input type="text" name="name" ></div>
			<div>나이 <input type="number" name="age" ></div>
			<div>전화 <input type="text" name="tel" ></div>
			<div>
				성별
				<input type="radio" name="gender" value="남자" /> 남
				<input type="radio" name="gender" value="여자" /> 여
				</div>
				<div>
					취미
					<input type="checkbox" name="hobbies" value="영화" />영화
					<input type="checkbox" name="hobbies" value="운동" />운동
					<input type="checkbox" name="hobbies" value="독서" />독서
					<input type="checkbox" name="hobbies" value="기타" />기타
					<input type="text" name="etc"/>
				</div>
				<div>
					주소
					<select name="addr">
						<option value = ""> ==주소선택== </option>
						<option value = "서울"> 서울 </option> 
						<option value = "경기"> 경기 </option>
						<option value = "강원"> 강원 </option>
						<option value = "제주"> 제주 </option>
					</select>
				</div>
				<div>
					좋아하는 음식<br />
					<select name="foods" multiple>
						<option value="한식">한식</option>
						<option value="양식">양식</option>
						<option value="일식">일식</option>
						<option value="중식">중식</option>
					</select>
				</div>
				<div>
					<input type="button" value="보내기" onclick="send(this.form)"/>
					<input type="reset" value="작성취소" />
					<input type="hidden" name="nickname" value="펭수" />
				</div>
		</fieldset>
	</form>
</body>
</html>