<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 데이터 읽기</title>
</head>
<body>

	<script type="text/javascript">
	
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				var jsonObj = eval( "(" + xhr.responseText + ")" ); // 보안이슈존재 (단일 JSON 객체는 앞뒤 괄호 추가)
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









