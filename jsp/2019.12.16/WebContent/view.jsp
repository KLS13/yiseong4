<%@page import="com.koreait.mybatis.BDto"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BBS 게시물 상세보기</title>
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
	td, th {
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
<script type="text/javascript">
	
	function update_page(f){
		f.action = "update_page.jsp";
		f.submit();
	}
	function remove_page(f){
		f.action = "remove_page.jsp";
		f.submit();
	}
	function view_all( f ) {
		f.action = "index.jsp";
		f.submit();
	}
	
	/* 댓글 */
</script>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String b_idx = request.getParameter("b_idx");
	
	//BDao 의 getBBS() 호출
	BDao bdao = BDao.getInstance();
	BDto bdto = bdao.getBBS(b_idx);
	
	//처음으로 열었을 때만 조회수가 증가되도록
	//게시물을 열 ㄸ ㅐsession 에 open 이라는 값을 저장
	//session에 open 값이 있으면 조회수를 증가시키지 않는다.
	//session에 open 값이 없으면 조회수를 증가시킨다.
	String open = (String)session.getAttribute("open");
	if( open == null ) {
	//open 이 null 이면 해당 게시물을 처음 열었다는 의미이다.
	session.setAttribute("open", "조회수");
	//표시할 게시물의 기존 hit 수에 +1 처리.
	int hit = bdto.getHit() +1;
	bdto.setHit(hit);  // hit가 증가된 bdto 를 생성
	bdao.getUpdateHit(bdto);
	}
	//수정, 삭제를 위해서 Session 영역에 bdto 저장
	session.setAttribute("bdto", bdto);
	
	%>
	<div>
		<h1>${param.b_idx}번 게시글 내용</h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>작성자</td>
						<td>${bdto.writer }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${bdto.title}</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>
							<c:if test="${bdto.filename ne null }"> 
							<a href="download.jsp?path=upload&filename=${bdto.filename}">${bdto.filename}</a></c:if>
							<c:if test="${bdto.filename eq null}"> 첨부파일 없음. </c:if>
						</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
						<pre>${bdto.content}</pre>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="게시글 수정하기" onclick="update_page(this.form)" />&nbsp;&nbsp;
							<input type="button" value="게시글 삭제하기" onclick="remove_page(this.form)" />&nbsp;&nbsp;
							<input type="button" value="목록으로 이동" onclick="view_all(this.form)" />
							
							<!-- 현재 페이지 번호를 가지고 페이지 이동을 한다. -->
							<input type="hidden" name="" value="" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>