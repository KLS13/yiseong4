<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		$("#btn").click(function() {
			//get 방식의 페이지 로드
			var message = "<ul>";
			$.get("xml_data.xml", function(data){
				// data 매개변수 : xml_data.xml 파일을 읽어 들인 내용
				$(data).find("person").each(function(){
					var name = $(this).find("name").text();
					var age = $(this).find("age").text();
					message += "<li> 이름 : " + name + "</li>"; 
					message += "<li> 나이 : " + age + "</li>"; 
				});
				message += "</ul>";
				
				$("#content").append(message);
			});
		});
	});
</script>
</head>
<body>
	<form>
		<input type="button" value="가져오기" id="btn" /> <br /><br />
	</form>
	<div>
		<h1 style="color:red;">xmlReader.jsp 입니다.</h1>
		<div id="content"></div>
	</div>
</body>
</html>