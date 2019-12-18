<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function send(f) {
		f.action = "/20_mvc5/Controller";
		f.submit();
	}
</script>
</head>
<body>
	<div>
		<h1> 정 보 입 력 페 이 지</h1>
		<form method="post">
			<table>
				<tbody>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" size="50" /></td>
					</tr>
					<tr>
						<td>나이</td>
						<td><input type="text" name="age" size="50" /></td>
					</tr>
					<tr>
						<td>연락처</td>
						<td><input type="text" name="phone" size="50" /></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="addr" size="50" /></td>
					</tr>
					<tr>
						<td>자기소개</td>
						<td>
							<textarea rows="3" cols="50" name="self">
							</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" value="전송" onclick="send(this.form)"/> &nbsp;
							<input type="reset" value="다시 작성" />
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>