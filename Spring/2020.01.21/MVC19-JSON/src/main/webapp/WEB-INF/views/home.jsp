<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>JSON_AJAX</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> 
	<script type="text/javascript">
		$(function(){
			$("#btn").click(function(){
				$.ajax({
					url: "jsonGet",
					method: "GET",
					success : function(jsonObj){
						var obj = jsonObj;
						$("#content").html("<h1>성명 : " + obj.name + ", 나이 : " + obj["age"] + "<h1>");
					}
				}); // end ajax
			}); // end click
		}); // end 페이지 로드
	</script>
</head>
<body>
	<h1>json_ajax</h1>
	JSON 데이터 가져오기
	<input type="button" id="btn" value="가져오기"/> <br /><br />
	<div id="content">
		
	</div>
	
</body>
</html>
