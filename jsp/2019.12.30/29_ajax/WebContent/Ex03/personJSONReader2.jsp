<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 데이터 읽기</title>
<script type="text/javascript" src="../js/json2.js"></script>
</head>
<body>

	<script type="text/javascript">
	
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				var jsonObj = JSON.parse(xhr.responseText); // JSON 최신 브라우저(IE 8.0 이상) 기본 내장
				
				// JSON.parse 가 동작하지 않으면,(IE 7.0 이하)
				// json2.js 파일을 포함하여 사용할 수도 있다.
				// json.org -> 화면 하단 JavaScript - json2.js - 다운로드
				// WebContent/js 폴더 생성 후 json2.js 저장
				// script type="text/javascript" src="../js/json2.js"   /script 추가
				
				document.body.innerHTML += "<ul>";
				document.body.innerHTML += "<li>이름 : " + jsonObj.name + "</li>";
				document.body.innerHTML += "<li>나이 : " + jsonObj.age + "</li>";
				document.body.innerHTML += "</ul>";
			}
		}
		
		xhr.open("GET", "person.html", true); // true : 비동기통신
		xhr.send();
	
	</script>

</body>
</html>









