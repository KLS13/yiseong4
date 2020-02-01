<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Write something else you want</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<script type="text/javascript">
	function remove(f) {
		var result = confirm("문의내용을 삭제하시겠습니까?");
		if(result){
		    f.action="qnaDelete";
		    f.submit();
		}else{
		    return false;
		}
	}
</script>
<style type="text/css">
.container {
margin-top: 150px;
}

	tr :nth-child(1) {
	width:150px;
}

pre {
	width:500px;
}
</style>

</head>
<body>
<div class="container">
      
<table class="table table-bordered">
    <thead>
        <caption> 고객지원 - 문의내용 </caption>
    </thead>
    <tbody>
        <form method="post">
        	<tr>
        		<th>문의 유형</th>
        		<td>
        		<c:if test="${qDto.qCategory eq 1 }">
        		공지사항
        		</c:if>
        		<c:if test="${qDto.qCategory eq 2 }">
        		가입정보변경
        		</c:if>
        		<c:if test="${qDto.qCategory eq 3 }">
        		오류 및 신고
        		</c:if>
        		<c:if test="${qDto.qCategory eq 4 }">
        		기타
        		</c:if>
        		</td>
        	</tr>
            <tr>
                <th>문의 제목</th>
                <td>${qDto.qTitle }</td>
            </tr>
            <tr>
                <th>작성자 ID</th>
                 <td>${qDto.uId_ }</td>
            </tr>
            <tr>
                <th>문의 내용</th>
                <td style="white-space: pre-line;">${qDto.qContent}</td>
            </tr>

            <tr>
                <td colspan="2">
					<input type="button" value="수정하기" onclick="location.href='qnaModifyPage?qIdx=${qDto.qIdx}'">
					<input type="button" value="삭제하기" onclick="remove(this.form)">
					<input type="button" value="목록으로 가기" onclick="history.back()">
					<input type="hidden" id="qIdx" name="qIdx" value="${qDto.qIdx}">
                </td>
            </tr>
       	</form>
    </tbody>
</table>
</div>
</body>
</html>