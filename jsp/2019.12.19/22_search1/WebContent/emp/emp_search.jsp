<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function dept_search(f) {
		var empDept = f.empDeptNo.value;
		if(empDept == "") {
			location.href = "/22_search1/EmpAction?empDeptNo=all";
		}else{
		location.href = "/22_search1/EmpAction?empDeptNo="+empDept;
		}
	}
</script>
</head>
<body>
	<div>
		<form>
			<h1>원하는 부서 번호를 선택한 뒤에 검색을 진행하세요</h1>
			부서번호 선택 :
			<select name="empDeptNo">
				<option value=""> ::부서선택:: </option>
				<option value="10"> 전략실 </option>
				<option value="20"> 홍보실 </option>
				<option value="30"> 기획실 </option>
				<option value="40"> 전산실 </option>
			</select>
			<br /><br />
			<input type="button" value="검색" onclick="dept_search(this.form)" />
		</form>
	</div>
</body>
</html>