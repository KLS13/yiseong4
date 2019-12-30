<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 JSON 읽기</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(function(){
		
		$.ajax({
			
			url: "json_data.js",
			dataType: "json",
			type: "GET",
			success: function( data ) {
				var message = "<table>";
				message += "<thead><tr><td>성명</td><td>나이</td></tr></thead>";
				message += "<tbody>";
				$.each( data, function( data ) {
					message += "<tr>";
					message += "<td>" + this.name + "</td><td>" + this.age + "</td>";
					message += "</tr>";
				} );
				message += "</tbody>";
				message += "</table>";
				$("#content").append(message);
			},
			error: function() {
				var message = "json_data.js 데이터를 가져오지 못했습니다.";
				$("#content").append(message);
			}
		}); // end ajax
		
	}); // end 페이지 로드


</script>
</head>
<body>
	
	<div id="content"></div>

</body>
</html>