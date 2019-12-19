<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객 검색</title>
<script type="text/javascript">

	function region_search(f) {

		f.action = "/22_search1/ClientAction";
		f.submit();
		//location.href="서블릿?region="+search;
	}
	
	function name_search(ff) {
		var name = ff.name.value;
		if(name == "" ) {
			location.href="/22_search1/ClientAction?name=all";
		}else{
			location.href="/22_search1/ClientAction?name="+name;
		}
	}
</script>
</head>
<body>
	<div>
		<h1>원하는 지역을 입력한 뒤 검색 버튼을 누르세요.</h1>
		<form>
			검색할 지역 입력 : <input type="text" name="region"  autofocus /> <br /><br />
			<input type="button" value="검색" onclick="region_search(this.form)" />
		</form>
		<hr />
		<h1>이름을 검색해주세요.</h1>
		<form>
			검색할 이름 입력 : <input type="text" name="name" autofocus /> <br /><br />
			<input type="button" value="검색" onclick="name_search(this.form)" />		
		</form>
	</div>
</body>
</html>