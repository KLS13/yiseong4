<%@page import="com.koreait.mybatis.BDao"%>
<%@page import="java.io.File"%>
<%@page import="com.koreait.mybatis.BDto"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String realPath = application.getRealPath("/upload");
	MultipartRequest mr = new MultipartRequest(
			request,
			realPath,
			1024 * 1024 * 10,
			"utf-8",
			new DefaultFileRenamePolicy()
			);
	
	BDto bdto = new BDto();
	String b_idx = mr.getParameter("b_idx");	// BDto 생성, view.jsp 이동에 사용
	bdto.setB_idx( Integer.parseInt(b_idx) );
	bdto.setContent( mr.getParameter("content") );
	bdto.setPw( mr.getParameter("pw") );
	bdto.setTitle( mr.getParameter("title") );
	bdto.setWriter( mr.getParameter("writer") );
	bdto.setIp( request.getRemoteAddr() );	// ip 확인은 mr 이 아닌 request 로 진행
	// 첨부파일 수정
	// 	1. 기존 첨부가 있는 경우
	// 		1) 새 첨부가 없으면 기존 첨부 그대로 사용
	//		2) 새 첨부가 있으면 기존 첨부 삭제 후 새 첨부 사용
	//	2. 기존 첨부가 없는 경우
	//		새 첨부 사용
	File newfile = mr.getFile("filename");			// 새 첨부
	String oldfile = mr.getParameter("oldfile");	// 기존 첨부
	if ( newfile != null ) { // 새 첨부가 있으면
		
		if  ( oldfile != null ) { // 기존 첨부가 있으면
			File removeFile = new File(realPath + "/" + oldfile);
			if ( removeFile.exists() ) {
				removeFile.delete(); // 기존 첨부 삭제
			}
		}
	
		bdto.setFilename( newfile.getName() );
	
	} else { // 새 첨부가 없으면
		
		if ( oldfile != null ) { // 기존 첨부가 있으면
			bdto.setFilename( oldfile );
		} else {
			bdto.setFilename("");
		}
		
	}
	
	BDao bdao = BDao.getInstance();
	int result = bdao.getUpdate(bdto);
	pageContext.setAttribute("result", result);

	String currentPage = mr.getParameter("currentPage");	
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
				alert("게시글이 수정되었습니다.");
				location.href = "view.jsp?b_idx=<%=b_idx%>&currentPage=<%=currentPage%>"; // pageContext 에 올려서 ${b_idx} 로 사용 가능.
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