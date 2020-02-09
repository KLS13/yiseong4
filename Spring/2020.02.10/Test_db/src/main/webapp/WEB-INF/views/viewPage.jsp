<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<th>번호</th>
	<td>${dto.mIdx }</td>
</tr>
<tr>
	<th>이름</th>
	<td>${dto.mName }</td>
</tr>
<tr>
	<th>폰번</th>
	<td>${dto.mPhone }</td>
</tr>
<tr>
	<th>주소</th>
	<td>${dto.mAddr }</td>
</tr>
<tr>
	<th>직업</th>
	<td>${dto.mJob }</td>
</tr>
<tr>
	<th>삭제</th>
	<td><input type="button" value="삭제" onclick="location.href='remove?mIdx=${dto.mIdx}'"/></td>
</tr>
</table>
</body>
</html>