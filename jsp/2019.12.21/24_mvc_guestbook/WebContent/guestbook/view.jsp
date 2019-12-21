<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세보기</title>
<style type="text/css">
	div {
		width: 800px;
		margin: auto;
		text-align: center;
	}
	table {
		width: 800px;
		border-collapse: collapse;
	}
	td {
		border: 1px solid black;
		padding: 5px;
	}
	td:nth-of-type(1) {
		width: 200px;
	}
	td:nth-of-type(2) {
		width: 600px;
		text-align: left;
	}
</style>
</head>
<body>
	<div>
		<h1>${dto.writer }의 방명록</h1>
		<table>
			<tbody>
				<tr>
					<td>작성자</td>
					<td>${dto.writer }</td>
				</tr>
				<tr>
					<td>제목</td>
					<td>${dto.title }</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>${dto.email }</td>
				</tr>
				<tr>
					<td>첨부파일</td>
					<td>
						<c:choose>
							<c:when test="${dto.filename eq null }">
								첨부파일 없음
							</c:when>
							<c:otherwise>
								<a href="/24_mvc_guestbook/download.do?path=upload&filename=${dto.filename }">${dto.filename }</a>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<td>내용</td>
					<td><pre>${dto.content }</pre></td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${dto.reg_date }</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="방명록 수정" onclick="location.href='/24_mvc_guestbook/pageForUpdate.do'" />&nbsp;&nbsp;
						<input type="button" value="방명록 삭제" onclick="location.href='/24_mvc_guestbook/pageForDelete.do'" />&nbsp;&nbsp;
						<input type="button" value="목록으로 이동" onclick="location.href='/24_mvc_guestbook/list.do'" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>