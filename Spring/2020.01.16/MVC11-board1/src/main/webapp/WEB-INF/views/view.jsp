<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세페이지</title>
</head>
<body>

	<div>
		<!-- 매핑값  /modify -->
		<form action="modify" method="post">
						<input type="hidden" name="bIdx" value="${bDto.bIdx }"/>
			<table>
				<tbody>
					<tr>
						<td>순번</td>
						<td>${bDto.bIdx }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${bDto.bWriter}</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="bTitle" value="${bDto.bTitle}" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea rows="10" cols="50" name="bContent">
								${bDto.bContent }
							</textarea>	
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정하기" />
							<input type="button" value="전체목록보기" onclick="location.href='list'"/>
							<input type="button" value="삭제하기" onclick="location.href='delete?bIdx=${bDto.bIdx}'" />
						</td>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>