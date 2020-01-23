<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- webapp/resources/styles 폴더 만들고 그 아래에 *.css 파일 넣기 -->
<link rel="stylesheet" type="text/css" href="resources/styles/main.css" />



</head>
<body>
	<div>
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>업로더</th>
					<th>이미지</th>
					<th>설명</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="fDto" items="${list }">
					<tr>
						<td>${fDto.fIdx }</td>
						<td>${fDto.fWriter }</td>
						<!-- 이미지가 아닌 파일을 첨부하면 파일명이 표시된다. img alt="${fDto.filename }" -->
						<td><a href="download?filename=${fDto.filename }"><img alt="${fDto.filename }" src="${pageContext.request.contextPath }/resources/upload/${fDto.filename }" style="width:100px; height:100px;" /></a></td>
						<td>${fDto.filecomment }</td>
						<td>${fDto.fRegdate }</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="5">
						<input type="button" value="업로드하기" onclick="location.href='uploadPage'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>