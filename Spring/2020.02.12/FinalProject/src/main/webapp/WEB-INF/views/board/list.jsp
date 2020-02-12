<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript">
	// modify 성공/실패
	var isModify = "${isModify}";
	if (isModify == "yes") {
		var modifyResult = "${modifyResult}";
		if (modifyResult == 0) {
			alert("수정 실패.");
		} else {
			alert("수정 성공.");
		}
	}
	// write 성공/실패
	var isWrite = "${isWrite}";
	if (isWrite == "yes") {
		var writeResult = "${writeResult}";
		if (writeResult == 0) {
			alert("추가 실패.");
		} else {
			alert("추가 성공.");
		}
	}
	// delete 성공/실패
	var isDelete = "${isDelete}";
	if (isDelete == "yes") {
		var deleteResult = "${deleteResult}";
		if (deleteResult == 0) {
			alert("삭제 실패.");
		} else {
			alert("삭제 성공.");
		}
	}
</script>
</head>
<body>

	<div>
		<table border="1">
			<thead>
				<tr>
					<td>순번</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
				</tr>
			</thead>
			<tbody>
				<c:if test="${result eq 0 }">
					<tr>
						<td colspan="4">게시물이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${result ne 0 }">
					<c:forEach var="bDto" items="${list }">
						<tr>
							<td>${bDto.bIdx }</td>
							<td>${bDto.bWriter }</td>
							<td><a href="view?bIdx=${bDto.bIdx }">${bDto.bTitle }</a></td>
							<td>${bDto.bDate }</td>
						</tr>
					</c:forEach>
					<tr>
						<td colspan="4">총 게시글 : ${result }개</td>
					</tr>
				</c:if>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<input type="button" value="새글작성" onclick="location.href='writePage'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
</body>
</html>