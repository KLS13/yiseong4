<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp:useBean</title>
</head>
<body>
	<%-- 
		자바빈 사용 방법
		1. 특정 패키지에 자바빈을 만든다.
		2. 자바빈을 생성한다.
			<jsp:useBean id="별명" clsee="패키지.자바빈의 클래스명" scope="생명주기(이 빈을 어디까지 살려둘것이냐)" />
			* scope
				page(기본) < request < session < application
		3. 자바빈에 값을 저장한다.
			<jsp:setProperty property="*" name="별명" />
		4. 자바빈의 값을 사용한다.
			<jsp:getProperty property="파라미터명" name="별명" />
	--%>

	<% request.setCharacterEncoding("utf-8"); %>

	<jsp:useBean id="myBean" class="bean.PersonVo"></jsp:useBean> <%-- PersonVo myBean = new PersonVo(); --%>
	<jsp:setProperty property="*" name="myBean"/> <%-- myBean.setName(request.getParmeter("name")) --%>
												  <%-- myBean.setName(request.getParmeter("age")) --%>
												  <%-- myBean.setName(request.getParmeter("height")) --%>
												  <%-- myBean.setName(request.getParmeter("addr")) --%>
	<h1>
		이름 : <jsp:getProperty property="name" name="myBean"/>
		나이 : <jsp:getProperty property="age" name="myBean"/>
		신장 : <jsp:getProperty property="height" name="myBean"/>
		주소 : <jsp:getProperty property="addr" name="myBean"/>	
	</h1>
</body>
</html>