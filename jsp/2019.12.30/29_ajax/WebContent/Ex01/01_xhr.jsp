<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- ajax : asynchronous javascript and xml 
	1. asynchronous : 비동기 통신을 의미한다. ( 클라이언트가 서버에게 정보를 요청하고 ,
										 서버가 응답할때까지 기다리지 않는 통신 방식 )
	   - 페이지 단위로 로드하지 않고, 페이지의 일부 단위를 받아서 페이지 동적 갱신
	   
	2. XMLHttpRequest 객체 : javascript 에서 ajax 처리를 할때 필요한 객체	 
									
--%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>01_xhr.jsp 페이지 입니다.</h1>
	<br /><hr />
	
	<%-- XMLHttpRequest 객체를 통해서 data.jsp 읽어 오자. --%>
	<script type="text/javascript">
		// 1. XMLHttpRequest 객체 생성 ( IE 7.0 이상 )
		var xhr = new XMLHttpRequest();
		
		// 2. open
		// open( 전송방식, 경로, 비동기유무 )
			// 1. 전송방식 : "GET" , "POST"
			// 2. 비동기 유무 : true(비동기) , false(동기)
		xhr.open("GET", "data.jsp", false);
			// 3. send ( 실제 실행 )
		xhr.send();
			// 4. responseText (결과)
		document.body.innerHTML += xhr.responseText;
	</script>
	<br />
	<h1>01_xhr.jsp 페이지 입니다.</h1>
</body>
</html>