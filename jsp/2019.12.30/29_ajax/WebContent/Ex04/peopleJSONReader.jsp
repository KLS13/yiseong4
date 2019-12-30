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
				var jsonList = eval( xhr.responseText );
				document.body.innerHTML += "<h1>" + JSON.stringify(jsonList) + "</h1>"; // stringify : JSON -> String
				// 배열 -> 각 요소
				for ( var i = 0, len = jsonList.length; i < len; i++ ) {
					
					// jsonList[i] : 하나의 JSON Object -> {"name":"alice","age":20}
					// jsonList[i].name
					// jsonList[i]["name"]
					
					document.body.innerHTML += "이름 : " + jsonList[i]["name"] + "<br />";
					document.body.innerHTML += "나이 : " + jsonList[i]["age"] + "<br />";
					
					for ( var p in jsonList[i] ) {
						// for-in 문에서는 jsonList[i].p 이 불가능하다.
						document.body.innerHTML += p + " : " + jsonList[i][p] + "<br />";
					}
					
				}
			}
		}
		
		xhr.open("GET", "people.js", true); // true : 비동기통신
		xhr.send();
	
	</script>

</body>
</html>