<%@page import="com.db.GreenDto"%>
<%@page import="com.db.GreenDao"%>
<%@page import="com.db.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 파라미터를 이용해서 GreenDto 객체를 생성하고,
	// 해당 객체를 전달하면 green 테이블에서 해당 데이터를 수정하고,
	// 그 결과를 반환하는 getUpdate() 메소드 호출
	request.setCharacterEncoding("utf-8");
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
	
	int result = GreenDao.getInstance().getUpdate(dto);
	
	if ( result > 0 ) {
		response.sendRedirect("view_all.jsp");
	} else { %>
		<script type="text/javascript">
			alert("회원 정보 수정에 실패했습니다. 다시 시도하세요.");
			history.back();
		</script>
 <% } %>