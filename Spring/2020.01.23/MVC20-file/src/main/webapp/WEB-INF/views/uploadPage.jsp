<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- webapp/resources/styles 폴더 만들고 그 아래에 *.css 파일 넣기 -->
<link rel="stylesheet" type="text/css" href="resources/styles/main.css" />


</head>
<body>
	<div>
		<!-- 첨부파일은 반드시 method="post" enctype="multipart/form-data" 처리합니다. -->
		<form action="upload" method="post" enctype="multipart/form-data">
			<table border="1">
				<tbody>
					<tr>
						<td>업로더</td>
						<td><input type="text" name="fWriter" /></td>
					</tr>
					<tr>
						<td>이미지첨부</td>
						<td><input type="file" name="file" /></td>
					</tr>
					<tr>
						<td>Comment</td>
						<td><textarea rows="10" cols="50" name="filecomment"></textarea></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<input type="submit" value="업로드" />
							<input type="button" value="목록으로 이동" onclick="location.href='imageList'" />
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</body>
</html>