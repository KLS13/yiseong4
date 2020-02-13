<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서 검색</title>
<script type="text/javascript">
	function search_dept( f ) {
		f.action = "/23_search2/Controller";
		f.submit();
	}
</script>
</head>
<body>

	<div>
		<form>
			<h1>부서를 선택하고 검색 버튼을 누르세요</h1>
			검색 부서 
			<select name="department_id">
				<option value="">::부서선택::</option>
				<option value="10">10</option>
				<option value="20">20</option>
				<option value="30">30</option>
				<option value="40">40</option>
				<option value="50">50</option>
				<option value="60">60</option>
				<option value="70">70</option>
				<option value="80">80</option>
				<option value="90">90</option>
				<option value="100">100</option>
				<option value="110">110</option>
			</select>
			<br /><br />
			<input type="button" value="검색" onclick="search_dept(this.form)" />
			<input type="hidden" name="cmd" value="deptList" />
		</form>
	</div>

</body>
</html>