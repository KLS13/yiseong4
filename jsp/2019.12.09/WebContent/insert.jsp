<%@page import="com.db.GreenDao"%>
<%@page import="com.db.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 파라미터를 이용해서 GreenDto 객체를 생성하고,
	// 해당 객체를 전달하면 green 테이블에 삽입하고,
	// 그 결과를 반환하는 getInsert() 메소드 호출
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
	
	int result = GreenDao.getInstance().getInsert(dto);
	
	if ( result > 0 ) {
		response.sendRedirect("view_all.jsp");
	} else { %>
		<script type="text/javascript">
			alert("회원 가입이 실패했습니다. 다시 시도하세요.");
			history.back();
		</script>
 <% } %>


<%-- 빈을 이용해서 파라미터를 값으로 가진 빈(dto) 만들기
<jsp:useBean id="dto" class="com.koreait.db.GreenDto" />	// 15번 라인
<jsp:setProperty property="*" name="dto"/ >					// 10 ~ 14, 16 ~ 20번 라인
--%>