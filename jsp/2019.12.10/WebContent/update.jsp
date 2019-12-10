<%@page import="com.koreait.db.GreenDto"%>
<%@page import="com.koreait.db.GreenDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% request.setCharacterEncoding("utf-8"); 

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");
	
	GreenDto dto = new GreenDto();
	dto.setId(id);
	dto.setPw(pw);
	dto.setName(name);
	dto.setAge(Integer.parseInt(age));
	dto.setAddr(addr);
	GreenDao dao = GreenDao.getInstance();
	int result = dao.getUpdate(dto);
	
	if ( result > 0 ) {
		response.sendRedirect("view_all.jsp");
	} else { %>
		<script type="text/javascript">
			alert("회원 수정에 실패했습니다.");
			history.go(-1);		// history.back()
		</script>
 <% } %>