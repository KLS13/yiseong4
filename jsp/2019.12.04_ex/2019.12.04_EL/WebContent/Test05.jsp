<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("testAtt", "page 영역 소속");
	request.setAttribute("testAtt", "request 영역 소속");
	session.setAttribute("testAtt", "session 영역 소속");
	application.setAttribute("testAtt", "application 영역 소속");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	그냥 testAtt: ${testAtt } <br> <%-- pageContext.getAttribute("testAtt"); --%>
	pageScope.testAtt: ${pageScope.testAtt }<br> <%-- pageContext.getAttribute("testAtt"); --%>
	requestScope.testAtt: ${requestScope.testAtt }<br> <%-- request.getAttribute("testAtt"); --%>
	sessionScope.testAtt: ${sessionScope.testAtt }<br> <%-- session.getAttribute("testAtt"); --%>
	applicationScope.testAtt: ${applicationScope.testAtt }<br> <%-- application.getAttribute("testAtt"); --%>
	<a href="Test06.jsp">Test06으로 리다이렉트</a>
</body>
</html>