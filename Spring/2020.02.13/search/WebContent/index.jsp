<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HR 계정의 EMPLOYEES 테이블 검색</title>
<script type="text/javascript">
	function search1() {
		location.href = "/23_search2/Controller?cmd=allList";
	}
	function search2() {
		location.href = "/23_search2/Controller?cmd=inputDept";
	}
	function search3() {
		location.href = "/23_search2/Controller?cmd=inputDynamic";
	}
</script>
</head>
<body>

	<div>
		<h1>원하는 검색 버튼을 클릭하세요.</h1>
		<form>
			<input type="button" value="전체직원보기" onclick="search1()" />&nbsp;&nbsp;
			<input type="button" value="부서별검색" onclick="search2()" />&nbsp;&nbsp;
			<input type="button" value="동적검색" onclick="search3()" />
		</form>
	</div>

</body>
</html>