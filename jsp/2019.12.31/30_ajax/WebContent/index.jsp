<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./js/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function(){
		
		// 1. CSV가져오기(콤마로 구분된 일반 텍스트 파일)
		$("#btn1").click( function(){
			$("#content").empty();
			$.ajax({
				url: "/30_ajax/csv.do",
				type: "POST",
				dataType: "text",
				success: function( data ) {
					var result = "";
					var members = data.split("/");
					var member = null;
					for ( var i = 0, len = members.length; i < len; i++ ) {
						result += "<tr>";
						member = members[i].split(","); // [1,id,name,..]
						for ( var j = 0, len2 = member.length; j < len2; j++ ) {
							result += "<td>" + member[j] + "</td>";
						}
						result += "</tr>";
					}
					$("#content").append(result);
				}, // end success
				error: function() {
					alert("실패");
				}
			}); // end ajax
		} ); // end btn1 click
		
		
		// 2. XML태그가져오기
		$("#btn2").click( function(){
			$("#content").empty();
			$.ajax({
				url: "/30_ajax/xmlTag.do",
				type: "POST",
				dataType: "xml",
				success: function( data ) {
					var result = "";
					$(data).find("member").each( function(){
						result += "<tr>";
						result += "<td>" + $(this).find("idx").text() + "</td>";
						result += "<td>" + $(this).find("id").text() + "</td>";
						result += "<td>" + $(this).find("name").text() + "</td>";
						result += "<td>" + $(this).find("email").text() + "</td>";
						result += "<td>" + $(this).find("phone").text() + "</td>";
						result += "<td>" + $(this).find("address").text() + "</td>";
						result += "</tr>";
					} ); // end each
					$("#content").append(result);
				}, // end success
				error: function() {
					alert("실패");
				}
			}); // end ajax
		} ); // end btn2 click
		
		
		// 3. XML속성가져오기
		$("#btn3").click( function(){
			$("#content").empty();
			$.ajax({
				url: "/30_ajax/xmlProperty.do",
				type: "POST",
				dataType: "xml",
				success: function( data ){
					var result = "";
					$(data).find("member").each(function(){
						result += "<tr>";
						result += "<td>" + $(this).attr("idx") + "</td>";
						result += "<td>" + $(this).attr("id") + "</td>";
						result += "<td>" + $(this).attr("name") + "</td>";
						result += "<td>" + $(this).attr("email") + "</td>";
						result += "<td>" + $(this).attr("phone") + "</td>";
						result += "<td>" + $(this).attr("address") + "</td>";
						result += "</tr>";
					}); // end each
					$("#content").append(result);
				}, // end success
				error: function() {
					alert("실패");
				}
			}); // end ajax
		} ); // end btn3 click
		
		
		// 4. JSON 가져오기
		$("#btn4").click( function(){
			$("#content").empty();
			$.ajax({
				url : "/30_ajax/json.do",
				type : "POST",
				dataType : "json",
				success : function(data) {
					var result = "";
					$.each(data, function(index, item){
						result += "<tr>";
						result += "<td>" + item.idx + "</td>";
						result += "<td>" + item.id + "</td>";
						result += "<td>" + item.name + "</td>";
						result += "<td>" + item["email"] + "</td>";
						result += "<td>" + item["phone"] + "</td>";
						result += "<td>" + item["addr"] + "</td>";
						result += "</tr>";
					});
					$("#content").append(result);
				},
				error: function() {
					alert("실패");
				}
			});
			
		}); // end btn1 click
		
		//5. 전국날씨
		
		$("#btn5").click( function(){
			$("#content").empty();
			$.ajax({
				url: "/30_ajax/weatherProperty.do",
				type: "POST",
				dataType: "xml",
				success: function( data ){
					var result = "";
					$(data).find("local").each(function(){
						result += "<tr>";
						result += "<td>" + $(this).text() + "</td>";
						result += "<td>" + $(this).attr("desc") + "</td>";
						result += "<td>" + $(this).attr("ta") + "</td>";
						result += "</tr>";
					}); // end each
					$("#weather").append(result);
				}, // end success
				error: function() {
					alert("실패");
				}
			}); // end ajax
		} ); // end btn5 click
	}); // end 페이지 로드
</script>
</head>
<body>

	<div>
		<h1>ajax 처리하기</h1>
		
		<form>
			<input type="button" value="CSV가져오기" id="btn1" />&nbsp;&nbsp;
			<input type="button" value="XML가져오기(태그)" id="btn2" />&nbsp;&nbsp;
			<input type="button" value="XML가져오기(속성)" id="btn3" />&nbsp;&nbsp;
			<input type="button" value="JSON가져오기" id="btn4" />&nbsp;&nbsp;
			<input type="button" value="전국날씨 보기" id="btn5" />
		</form>
		
		<br /><hr /><br />
		
		
		<table border="1">
			<thead>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>성명</td>
					<td>이메일</td>
					<td>연락처</td>
					<td>주소</td>
				</tr>
			</thead>
			<tbody id="content"><!-- ajax로 채워질 부분 -->
				
			</tbody>
		</table>
		<!--  전국날씨 -->
		<hr /> <br />
		<table>
			<thead>
				<tr>
					<td>지역</td>
					<td>날씨</td>
					<td>온도</td>
				</tr>
			</thead>
			<tbody id="weather"> <!-- ajax로 채워질 부분 -->
			
			</tbody>
		</table>
	</div>
</body>
</html>