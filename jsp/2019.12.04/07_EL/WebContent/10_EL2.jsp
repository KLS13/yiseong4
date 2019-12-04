<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>객체(빈) 받기</title>
</head>
<body>
	<h1> dto에 저장된 필드 사용하기 </h1>
	<ul>
		<li>학번 : ${BEAN.no}</li>
		<li>이름 : ${BEAN.name}</li>
		<li>학과 : ${BEAN.dept}</li>
		<li>나이 : ${BEAN.age}</li>
	</ul>
	<h1> dto에 저장된 getter 사용하기</h1>
	<ul>
		<li>학번 : ${BEAN.getNo()}</li>
		<li>이름 : ${BEAN.getName()}</li>
		<li>학과 : ${BEAN.getDept()}</li>
		<li>나이 : ${BEAN.getAge()}</li>
	</ul>
</body>
</html>