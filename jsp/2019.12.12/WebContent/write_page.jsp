<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록 작성하기</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
	td:nth-of-type(1):hover {
		background: black;
		color : white;
		font-style: italic;
	}
	
	td,th{
		padding:6px;
	}
	
	tr:nth-of-type(7):hover {
		background: gray;
	}
</style>
<script type="text/javascript">
	function writeGuestbook() {
		var f = document.forms.myForm;
		if( f.writer.value == "") {
			alert("작성자를 입력해주세요");
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div>
		<h1>방명록을 작성해주세요</h1>
		<form name="myForm" action="write.jsp" method ="post" enctype="multipart/form-data" onsubmit="return writeGuestbook()">
			<table border="1">
				<tbody>
					<tr>
						<td>작성자</td>
						<td><input type="text" name="writer" size = "80" /></td>
					</tr>
					<tr>
						<td>제목</td>
						<td><input type="text" name="title" size = "80" /></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" size = "80" /></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw" size = "80" /></td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td><input type="file" name="filename" /></td>
					</tr>
					<tr>
						<td>내용</td>
						<td>
						<textarea rows="10" cols="100" name="content" placeholder="내용을 입력하세요"></textarea>
						</td>
					</tr>
					<tr>
						<th colspan="2"><input type="submit" value="방명록 저장"/>&nbsp;&nbsp;
										<input type="reset" value="다시 작성" />&nbsp;&nbsp;
										<input type="button" value="목록으로 이동" onclick="location.href='index.jsp'"/>
						</th>
						
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>