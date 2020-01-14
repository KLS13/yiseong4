<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 학생 데이터 전송 폼 -->
	<form method="POST" action="v01">
		이름 <input type="text" name="name" /> <br /><br />
		학과 <input type="text" name="dept" /> <br /><br />
		학년 <input type="text" name="gradeNo" /> <br /><br />
		반 <input type="text" name="classNo" /> <br /><br />
		<input type="submit" value="전송" />
	</form>
	
	<hr />
	
	<form method="POST" action="v02">
		이름 <input type="text" name="name" /> <br /><br />
		학과 <input type="text" name="dept" /> <br /><br />
		학년 <input type="text" name="gradeNo" /> <br /><br />
		반 <input type="text" name="classNo" /> <br /><br />
		<input type="submit" value="전송" />
	</form>
	

</body>
</html>