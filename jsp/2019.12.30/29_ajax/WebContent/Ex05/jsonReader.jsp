<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSON 데이터 읽기</title>
<script type="text/javascript" src="../js/jquery-3.4.1.js"></script>
<script type="text/javascript">

	$(function(){ // 페이지 로드 이벤트
		
		$("#btn").click(function(){ // btn을 클릭하면
			
			$.getJSON("json_data.js", function( data ){ // $.getJSON() : get 방식으로 JSON 데이터 읽기
				
				// 매개변수 data : json_data.js 에서 읽어 들인 데이터
				
				var message = "<table>";
				message += "<thead>";
				message += "<tr>";
				message += "<td>성명</td><td>나이</td>";
				message += "</tr>";
				message += "</thead>";
				message += "<tbody>";
				$.each( data, function( data ){ // data 를 대상으로 function 반복
					message += "<tr>";
					message += "<td>" + this.name + "</td><td>" + this["age"] + "</td>";
					//message += "<td>" + this["name"] + "</td><td>" + this["age"] + "</td>";
					message += "</tr>";
				} );
				message += "</tbody>";
				message += "</table>";
				
				$("#content").empty();
				$("#content").append(message); // content 에 message 추가			
			});			
		});	
	});

</script>
</head>
<body>

	<form>
		<input type="button" value="가져오기" id="btn" />
		<br /><br />
	</form>

	<div>
		<h1 style="color: red;">jsonReader.jsp 입니다.</h1>
		<div id="content"></div>
	</div>

</body>
</html>