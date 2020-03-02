<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../layout/header.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<table class="table table-bordered">
		<caption> 시크릿톡 - 비밀일기 </caption>
			<tr>
				<th><label>제목</label></th>
				<td>${view.title}</td>
			</tr>
			<tr>
				<th><label>작성자</label></th>
				<td>${view.writer}</td>
			</tr>
			<tr>
				<th><label>내용</label></th>
				<td>${view.content}</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="location.href='/board/modify?bno=${view.bno}'"
					class="pull-right">수정</button>
					
					<button type="button" onclick="location.href='/board/delete?bno=${view.bno}'"
					class="pull-right">삭제</button>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>