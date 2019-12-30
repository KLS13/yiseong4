<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax로 XML 읽기</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(function(){
		
		$.ajax({
			
			url: "xml_data.xml",
			dataType: "xml",
			type: "GET",
			success: function( data ) {
				var message = "<ul>";
				$(data).find("person").each(function(){
					var name = $(this).find("name").text();
					var age = $(this).find("age").text();
					message += "<li>이름 : " + name + "</li>";
					message += "<li>나이 : " + age + "</li>";
				}); // end each
				message += "</ul>";
				$("#content").append(message);
			},
			error: function() {
				var message = "xml_data.xml 데이터를 가져오지 못했습니다.";
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








