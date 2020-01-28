<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">

.imgUpload {
	width: 200px;
	height: 200px;
	margin: 20px;
}
body { background: #fff; }
.listtable {
  border-collapse: collapse;
}  
.listtable th {
  padding: 10px;
  color: #168;
  border-bottom: 3px solid #168;
}
.listtable td {
  color: #669;
  padding: 10px;
  border-bottom: 1px solid #ddd;
   text-align: center;
}
.listtable tr:hover td {
  color: #004;
}

</style>
</head>
<body>
<h1> 유저의 아이디와 포인트 정보 + 교환목록으로 이동 추가 + CSS 작업<br />
교환하기(상세페이지이동) </h1>
	<form>
		<table class="listtable">
			<c:if test="${empty list}">
				<tr>
					<td>상품이 없습니다.</td>
				</tr>
			</c:if>

			<c:if test="${not empty list}">
			<c:set var="count" value="1"/>
			
				<c:forEach var="gdto" items="${list}">
					
					<c:if test="${gdto.gState eq 1}">  <!-- 상태가 1 인 물품 : 품절이 아닌 굿즈 -->
					
					<c:if test="${count eq 5 }">  
						<tr>
						<c:set var="count" value="1"/>
					</c:if>
					
						<td>
							${gdto.gIdx } <br />
							<img
							src="${pageContext.request.contextPath}/${gdto.gImage}"
							class="imgUpload" ><br />
							${gdto.gName }<br />
							${gdto.gQuantity }개<br />
							${gdto.gPrice }point<br />
							<input type="button" value="구매하기" onclick="location.href='goodsBuyPage?gIdx=${gdto.gIdx}'">
						</td>
					
					<c:if test="${count eq 4}">
						</tr>
					</c:if>
						<c:set var="count" value="${count + 1}" />
					
					</c:if>
					
				</c:forEach>
			</c:if>
		</table>
	</form>
</body>
</html>