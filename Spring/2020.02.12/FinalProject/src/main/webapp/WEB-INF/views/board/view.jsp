<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<script type="text/javascript">
	function remove(f) {
		var check = confirm("정말 삭제할까요?");
		if (check) {
			f.action="";
			f.submit();
		}
	}
</script>
</head>
<body>
	<div>
		<form action="modify" method="post">
			<table border="1">
				<tbody>
					<tr>
						<td>순번</td>
						<td><input type="text" name="bIdx" value="${bDto.bIdx }" readonly /></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${bDto.bWriter }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="bTitle" value="${bDto.bTitle }" />
					</tr>
					<tr>
						<td>내용</td>
						<td><textarea rows="10" cols="50" name="bContent">${bDto.bContent }</textarea>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="수정" />
							<input type="button" value="목록" onclick="" />
							<input type="button" value="삭제" onclick="remove(this.form)" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>