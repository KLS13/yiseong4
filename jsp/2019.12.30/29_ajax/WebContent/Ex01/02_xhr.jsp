<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		var xhr = new XMLHttpRequest();
		
		/* 
			onreadystatechange 이벤트 속성
			1) 각 진행 단계를 확인하는 이벤트 속성
			2) onreadystatechange 이벤트속성을 사용하면 "비동기 통신"을 할 수 있다.
			readyState 값 : 데이터의 전송결과
			0 : 객체 생성 하고, open은 안함
			1 : open() 하고, send() 는 안함
			2 : send() 하고, 데이터를 받지 않았을 때
			3 : send() 하고, 데이터를 일부만 받았을 때
			4 : 성공
			status 값
			- 오류 관련 
			200 : 오류없음
			4XX : 클라이언트 측 오류
			5XX : 서버 측 오류
		*/
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4) {  
				if(xhr.status == 200 ) {
					document.body.innerHTML += xhr.responseText;
				}
			}
		}
		xhr.open("GET","data.jsp",true); // true : 비동기 통신
		xhr.send();
	</script>
</body>
</html>