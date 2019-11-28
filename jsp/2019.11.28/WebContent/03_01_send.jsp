<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//보내는 데이터를 담는 request 객체는 항상 인코딩한다.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		margin:5px;
	}
	
	
</style>
<script type="text/javascript">
	function send(myForm) {
		myForm.action="/03_jsp/03_02_receive.jsp";  		/* 	 /컨텍스트패스/jsp파일.jsp    */
		myForm.submit();
	}
</script>
</head>
<body>
	<form method = "post">
		<fieldset>
			<legend>개인정보전송</legend>
			<div>
				이름 <input type="text" name="name"/>
			</div>
			<div>
				나이 <input type="number" name="age"/>
			</div>
			<div>
				<textarea name="info" rows="5" cols="50" placeholder="자기소개"></textarea>
			</div>
			<div class="centered">
				<input type="button" value="보내기" onclick="send(this.form)" />
			</div>
		</fieldset>
	</form>
</body>
</html>