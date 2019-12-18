<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>요청 결과 페이지</title>
</head>
<body>
	<div>
		<h1>1. request 확인</h1>
		<ul>
			<li>${name }</li>
			<li>${age }</li>
			<li>${phone }</li>
			<li>${addr }</li>
			<li>${self }</li>
		</ul>
		<h1>2. session 확인</h1>
		<ul>
			<li>${sessionScope.name}</li>
			<li>${sessionScope.age}</li>
			<li>${sessionScope.phone}</li>
			<li>${sessionScope.addr}</li>
			<li>${sessionScope.self}</li>
		</ul>
		<h1>3. dto 확인</h1>
		<ul>
			<li>${dto.name }</li>
			<li>${dto.age }</li>
			<li>${dto.phone }</li>
			<li>${dto.addr }</li>
			<li>${dto.self }</li>
		</ul>
		
		<h1>4. map 확인</h1>
		<ul>
			<li>${map.name }</li>
			<li>${map.age }</li>
			<li>${map.phone }</li>
			<li>${map.addr }</li>
			<li>${map.self }</li>
		</ul>
	</div>
</body>
</html>