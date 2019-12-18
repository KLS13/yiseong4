<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
		<h1>성적 처리 결과</h1>
		<ul>
			<li> 성명 : ${sessionScope.name }</li>
			<li> 국어 : ${sessionScope.kor }</li>
			<li> 영어 : ${sessionScope.eng }</li>
			<li> 수학 : ${sessionScope.mat }</li>
			<li> 평균 : ${sessionScope.avg }</li>
			<li> 학점 : ${sessionScope.grade }</li>
		</ul>
	</div>
</body>
</html>