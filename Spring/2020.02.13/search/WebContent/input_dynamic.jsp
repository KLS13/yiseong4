<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동적 검색</title>
<script type="text/javascript">
	function search_dynamic( f ) {
		f.action = "/23_search2/Controller";
		f.submit();
	}
</script>
</head>
<body>

	<div>
		<form>
			<h1>무엇을 검색하시겠습니까?</h1>
			검색 옵션 
			<select name="key">
				<option value="1">직원ID</option>
				<option value="2">이름</option>
				<option value="3">부서ID</option>
			</select>
			<br /><br />
			검색 내용 <input type="text" name="value" />
			<br /><br />
			<input type="button" value="검색" onclick="search_dynamic(this.form)" />
			<input type="hidden" name="cmd" value="dynamicList" />
		</form>
	</div>

</body>
</html>