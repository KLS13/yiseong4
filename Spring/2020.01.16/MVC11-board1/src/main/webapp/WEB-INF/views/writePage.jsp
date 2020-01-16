<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 추가하기</title>
</head>
<body>
	<div>
		<!-- @RequestMapping("/write") -->
		<form action="write" method="post">
			<table border="1">
				<tbody>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="bWriter" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="bTitle" />
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="50" name="bContent"></textarea>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="저장하기" />
							<input type="button" value="전체목록보기" onclick="location.href='list'" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
















</body>
</html>