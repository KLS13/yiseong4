<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>request 객체의 정보</h1>
	<ul>
		<li>클라이언트 ip 주소(★): <%=request.getRemoteAddr() %></li>
		<li>요청정보 길이 : <%= request.getContentLength() %></li>
		<li>요청정보 인코딩 : <%= request.getCharacterEncoding() %></li>
		<li>요청정보 컨텐트 타입 : <%= request.getContentType() %></li>
		<li>요청정보 프로토콜 : <%= request.getProtocol() %></li>
		<li>요청정보 전송방식(★) : <%= request.getMethod() %></li>
		<li>요청 URI(★) : <%= request.getRequestURI() %></li>
		<li>요청 URL(★) : <%= request.getRequestURL() %></li>
		<li>컨텍스트 경로(★) : <%= request.getContextPath() %></li>
		<li>컨텍스트 정보 : <%= request.getServletContext() %></li>
		<li>서버 이름 : <%= request.getServerName() %></li>
		<li>서버 포트번호 : <%= request.getServerPort() %></li>
		
	</ul>
	
	<h1>request 객체의 주요 메소드</h1>
	<ul>
		<li>포워드: request.getRequestDispatcher("이동할경로").forward(request, response); </li>
		<li>세션 얻기: request.getSession(); </li>
		<li>파라미터 얻기: request.getParameter(); </li>
		<li>파라미터들 얻기: request.getParameterValues(); </li>
		<li>쿠키 얻기: request.getCookies(); </li>
		<li>속성값 얻기: request.getAttribute("속성"); </li>
		<li>속성값 저장하기: request.setAttribute("속성", 값); </li>
	</ul>
</body>
</html>
