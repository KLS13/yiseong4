<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style type="text/css">
.qnaList{
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
	margin-top: 200px;
}

	table{
		border-collapse: collapse;
		width : 1000px;
	}
	tr td{
		padding: 10px;
		padding-right: 20px;
	}
	
	tr :nth-child(1) {
		width : 20px;
		text-align: center;
	}
	tr :nth-child(2) {
		width : 500px;
	}
	tr :nth-child(3) {
		width : 110px;
		text-align: center;
	}
	tr :nth-child(4) {
		width : 110px;
		text-align: center;
	}
	tr :nth-child(5) {
		text-align: center;
	}
	
	a:link {
		text-decoration: none;	
		color : black;
	}
</style>
</head>
<body>
<div class="qnaList">
		<table border="1">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>최종작성일</th>
					<th>답변상태</th>
			</thead>
			<tbody>
				<c:if test="${result eq 0 }">
					<tr>
						<td colspan="4"> 게시물이 없습니다. </td>
					</tr>
				</c:if>
				<c:if test="${result ne 0 }">
				<c:forEach var="qDto" items="${list}">
					<tr>
						<td>${qDto.qIdx }</td>
						<td>
						<c:if test="${qDto.qCategory eq 1 }">
						<a href="qnaViewPage?qIdx=${qDto.qIdx}"><font style="font-weight: bold">${qDto.qTitle }</font></a>
						</c:if>
						<c:if test="${qDto.qCategory ne 1 }">
						<a href="qnaViewPage?qIdx=${qDto.qIdx}">${qDto.qTitle }</a>
						</c:if>
						</td>
						<td>${qDto.uId_}</td>
						<td>${qDto.qDate}</td>
						<td>
						<c:if test="${qDto.qCategory ne 1 && qDto.qCheck eq 0 }">
						답변없음
						</c:if>
						<c:if test="${qDto.qCheck eq 1 }">
						답변완료
						</c:if>
						<c:if test="${qDto.qCategory eq 1 && qDto.qCheck eq 0}">
						공지사항
						</c:if>
						</td>
					</tr>
					
				</c:forEach>
			
				</c:if>
				<tr>
					<td colspan="5">총 문의글 수 : ${ result } 개</td>
				</tr>	
				<tr>
					<td colspan="5">${pagingView}</td>
				</tr>	
			</tbody>
			<tfoot>
			
				<tr>
					<td colspan="5">
						<input type="button" value="문의하기" onclick="location.href='qnaWritePage'" />
					</td>
				</tr>
			</tfoot>
		</table>
	</div>

</body>
</html>