<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.koreait.mybatis.BDao"%>
<%@page import="com.koreait.mybatis.BDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// 1. insert_page.jsp 에서 넘어온 파라미터 처리(첨부파일 포함)
	String realPath = application.getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
			request,
			realPath,
			1024 * 1024 * 10,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	// 2. DB로 보낼 dto 만들기
	BDto bdto = new BDto();
	bdto.setWriter( mr.getParameter("writer"));
	bdto.setTitle( mr.getParameter("title"));
	bdto.setContent( mr.getParameter("content"));
	bdto.setPw(mr.getParameter("pw"));
	bdto.setIp(request.getRemoteAddr()); //request 를 통해서 ip 주소 알아내기
	if ( mr.getFile("filename") == null ) {
		bdto.setFilename("");
	} else {
		bdto.setFilename( mr.getFilesystemName("filename") );
	}
	
	// 3. DAO 를 통해서 DTO 를 전달해 저장하기
	BDao bdao = BDao.getInstance(); //factory 생성
	int result = bdao.getInsert(bdto); // BDao 의 getInsert() 호출
	pageContext.setAttribute("result", result); // EL을 사용하기 위해   ( 4가지 영역에 있어야 EL 사용 가능 )
	
	// 새 게시물을 정상적으로 삽입하고 index.jsp 페이지로 돌아가는 경우
	// insert_page.jsp 에서 전달 받은 currentPage 로 이동하지 않을 수 있다.
	int totalRecord = 0;
	int totalPage = 0;
	int recordPerPage = 3;
	
	totalRecord = bdao.getTotalRecord();
	totalPage = totalRecord / recordPerPage;
	if( totalRecord % recordPerPage != 0) {
		totalPage++;
	}
	
	String currentPage = totalPage + "";
%>
<!-- insert_page.jps -> insert.jsp -> BDao -> bbs.xml -> DB -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${result gt 0 }">
			<script type="text/javascript">
				alert("새 게시글이 등록되었습니다.");
				location.href = "index.jsp?currentPage=<%=1%>";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("게시글 등록이 실패하였습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>
</body>
</html>











