<%@page import="com.koreait.mybatis.GuestbookDao"%>
<%@page import="com.koreait.mybatis.GuestbookDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	// request.setCharacterEncoding("utf-8");

	// form 에서 enctype="multipart/form-data" 방식으로 넘어오는 데이터는
	// request 를 직접 사용하지 않는다. (그냥 사용하면 null)
	// MultipartRequest 클래스를 이용한다.

	// 업로드 될 파일의 실제 경로 구하기
	// String realPath = request.getServletContext().getRealPath("/upload");
	String realPath = application.getRealPath("/upload");
	
	// 업로드
	MultipartRequest mr = new MultipartRequest(
			request,
			realPath,
			1024 * 1024 * 10,	// 10MB
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	// 나머지 파라미터를 이용해서 GuestbookDto 만들기
	GuestbookDto dto = new GuestbookDto();
	dto.setWriter( mr.getParameter("writer") );
	dto.setEmail( mr.getParameter("email") );
	dto.setContent( mr.getParameter("content") );
	dto.setPw( mr.getParameter("pw") );
	dto.setTitle( mr.getParameter("title") );
	
	// 첨부파일 유무에 따라서 filename 값을 결정
	if ( mr.getFile("filename") != null ) {
		dto.setFilename( mr.getFilesystemName("filename") );
	} else {
		dto.setFilename("");
	}
	
	// GuestbookDao 를 통해서 insert() 메소드 호출
	int result = GuestbookDao.getInsert(dto);
	pageContext.setAttribute("result", result);
	
%>

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
				alert("방명록이 정상적으로 작성되었습니다.");
				location.href="index.jsp";
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("방명록이 정상적으로 작성되지 않았습니다.");
				history.back();
			</script>
		</c:otherwise>
	</c:choose>

</body>
</html>