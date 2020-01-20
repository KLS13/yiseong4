<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>새 글 쓰기</title>
</head>
<body>

	<div>
		<!-- 매핑값  /write -->
		<form action="write" method="post">
			<table>
				<tbody>
					<tr>
						<td>이름</td>
						<td><input type="text" name="bName"/></td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td><input type="text" name="bTel"/></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="bAddr"/></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="bEmail"/></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
							<textarea rows="10" cols="50" name="bContent">
							</textarea>	
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="저장하기"/>
							<input type="button" value="전체목록보기" onclick="location.href='list'"/>
						</td>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>