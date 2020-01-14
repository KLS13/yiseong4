<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>
		이름 : ${sDto.name } <br />
		학과 : ${sDto.dept } <br />
		학년 : ${sDto.gradeNo } <br />
		반 : ${sDto.classNo } <br />
	</div>
	
	<hr />
	<div>
		이름 : ${s.name } <br />
		학과 : ${s.dept } <br />
		학년 : ${s.gradeNo } <br />
		반 : ${s.classNo } <br />
	</div>
	

</body>
</html>