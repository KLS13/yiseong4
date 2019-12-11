<%@page import="com.mybatis.GreenDao"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.mybatis.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");

	GreenDto dto = new GreenDto();
	dto.setId( request.getParameter("id") );
	dto.setPw( request.getParameter("pw") );
	dto.setName( request.getParameter("name") );
	dto.setAge( Integer.parseInt(request.getParameter("age")) );
	dto.setAddr( request.getParameter("addr") );
	
	// insert 문의 커밋 처리를 위하여 다음 순서로 처리한다.
	// 1. 수동 커밋을 사용	: openSession(false)
	// 2. 커밋				: commit()
	// 3. 닫기				: close()
	
	// SqlSessionFactory factory = DBService.getFactory();
	// SqlSession sqlSession = factory.openSession(false);
	
	// dao 를 사용하기 전
	// try {
		/*
			insert 문의 메소드
			1. insert("sql문의 id")
			2. insert("sql문의 id", 파라미터)
		*/
	//	int result = sqlSession.insert("insert", dto);
		
	//	if ( result > 0 ) {
	//		sqlSession.commit();
	//		sqlSession.close();
	//		response.sendRedirect("view_all.jsp");
	//	} else { 
	//		sqlSession.close(); %>
	//		<script type="text/javascript">
	//			alert("회원 삽입에 실패했습니다.");
	//			history.back();
	//		</script> <%
	//	}
//	} catch (Exception e) {
	//	sqlSession.close(); %>
	//	<script type="text/javascript">
	//		alert("회원 삽입에 실패했습니다.");
	//		history.back();
	//	</script> <%
//	}
	
	
	GreenDao dao = GreenDao.getInstance();
	int result = dao.insert(dto);
	
	if(result > 0) {
		out.println("<script>");
		out.println("alert('회원이 삽입되었습니다.')");
		out.println("location.href='view_all.jsp'");
		out.println("</script>");
	} else {
		out.println("<script>");
		out.println("alert('회원이 삽입되지 않았습니다.')");
		out.println("history.back()");
		out.println("</script>");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
%>