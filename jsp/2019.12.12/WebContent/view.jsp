<%@page import="com.koreait.mybatis.GuestbookDao"%>
<%@page import="com.koreait.mybatis.GuestbookDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 상세보기</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String idx = request.getParameter("idx");
		
		GuestbookDto dto = GuestbookDao.selectById(idx);
		// session 에 올려서 수정하고 삭제할 때도 활용한다.
		session.setAttribute("dto", dto);
	%>

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
								<a href="download.jsp?path=upload&filename=${dto.filename }">${dto.filename }</a>
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
						<input type="button" value="방명록 수정" onclick="" />&nbsp;&nbsp;
						<input type="button" value="방명록 삭제" onclick="location.href='remove_page.jsp'" />&nbsp;&nbsp;
						<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'" />
					</td>
				</tr>
			</tbody>
		</table>
	</div>

</body>
</html>