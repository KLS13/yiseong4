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
		var xhr;
		try {
			xhr = new XMLHttpRequest(); // IE 7.0 이상
		}catch (e) {
			xhr = new ActiveXObject("Microsoft.XMLHTTP"); // IE 6.0 이하
		}
		xhr.onreadystatechange = function() {
			if ( xhr.readyState == 4 && xhr.status == 200 ) {
				document.getElementById("receive").innerHTML += xhr.responseText;
			}
		}
		xhr.open("GET","data.jsp",true);  // true : 비동기 통신
		xhr.send();
		
	</script>
	
	<div id="receive">
	
	</div>

</body>
</html>