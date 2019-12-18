<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		border-collapse: collapse;
	}
</style>
<script type="text/javascript">

	function score(f) {
		
		f.action = "/21_mvc6/Controller";
		f.submit();
	}
</script>
</head>
<body>
	<form method="post">
	<div>
		<table border="1">
			<tbody>
				<tr>
					<th> 성명  </th>
					<td> <input type="text" name="name"/> </td>
				</tr>
				<tr>
					<th> 국어  </th>
					<td> <input type="text" name="kor"/> </td>
				</tr>
				<tr>
					<th> 영어  </th>
					<td> <input type="text" name="eng"/> </td>
				</tr>
				<tr>
					<th> 수학  </th>
					<td> <input type="text" name="mat"/> </td>
				</tr>
				<tr>
					<th colspan="2">
					<input type="button" value="성적확인" onclick="score(this.form)" />
					</th>
				</tr>
			</tbody>
		</table>
	</div>
	</form>
</body>
</html>