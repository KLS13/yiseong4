<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>페이지 이동</title>
<script type="text/javascript">	
</script>
</head>
<body>
	<%-- 1. parameter 저장/확인 --%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
%>
	<h1>페이지 이동의 중간페이지 입니다.</h1>
	<div> 이름 = <%= name %></div>
	<div> 나이 = <%= age %></div>

	<hr />
	<%-- 1. <a> 태그로 이동하기 --%>
	<a href="05_03_page_move.jsp">parameter 전달하지 않기</a>
	<a href="05_03_page_move.jsp?name=<%=name%>&age=<%=age%>">parameter 전달하기</a>
	<br /><br />
	<hr />
	<%-- 2. location.href 로 이동하기 --%>
	<button onclick="location.href='/03_jsp/05_03_page_move.jsp'">parameter 전달하지 않기 </button>
	<button onclick="location.href='/03_jsp/05_03_page_move.jsp?name=<%=name%>&age=<%=age%>'">parameter 전달하기 </button>
	<br /><br />
	<hr />
	
	<%-- 4. 리다이렉트(redirect)로 이동하기 --%>
	<%
		//request 값을 유지하지않고 이동하는 방식이다
		//URL을 통해서 페이지 이동여부를 확인할 수 있다.
		//시스템 변경이 있는 경우에 활용하는 방식이다.(회원가입, 로그인, 글쓰기)
		//"새로고침"을 했을 때 처리작업을 다시 수행하면 안되는 경우에 활용.
		response.sendRedirect("05_03_page_move.jsp");
	%>
	
	<%-- 3. 포워드(forward) 로 이동하기 
	<%
		//request 값을 유지하는 이동방식
		//URL을 통해서 페이지 이동 여부를 확인할 수 없다.
		//시스템 변경이 없는 경우에 활용하는 방식이다.
		//"새로고침"을 했을 때 처리작업을 다시 수행해도 되는 경우에 활용하는 방식.
		request.getRequestDispatcher("05_03_page_move.jsp").forward(request, response);
	%>
	
	--%>
	
	
</body>
</html>