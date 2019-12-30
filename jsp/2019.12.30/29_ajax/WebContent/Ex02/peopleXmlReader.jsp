<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>people.xml 파일 읽기</title>
</head>
<body>

	<script type="text/javascript">
	
		var xhr = new XMLHttpRequest();
		
		xhr.onreadystatechange = function() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				// 일반 텍스트 형식 결과 : responseText (html, jsp, txt 등)
				// XML 결과 : responseXML
				var xmlData = xhr.responseXML;
				var names = xmlData.getElementsByTagName("name"); // name 태그의 데이터가 names 배열에 저장
				var ages = xmlData.getElementsByTagName("age"); // age 태그의 데이터가 ages 배열에 저장
				for ( var i = 0, len = names.length; i < len; i++ ) {
					var name = names[i].childNodes[0].nodeValue;
					var age = ages[i].childNodes[0].nodeValue;
					document.body.innerHTML += "<ul>";
					document.body.innerHTML += "<li>이름 : " + name + "</li>";
					document.body.innerHTML += "<li>나이 : " + age + "</li>";
					document.body.innerHTML += "</ul>";
				}
			}
		}
		
		xhr.open("GET", "people.xml", true); // true : 비동기통신
		xhr.send();
	
	</script>

</body>
</html>