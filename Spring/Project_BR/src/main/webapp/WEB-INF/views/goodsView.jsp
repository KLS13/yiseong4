<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">
* {
	box-sizing: border-box;
	color: black;
	text-decoration: none;
}

.container-info {
	float: left;
	width: 24%;
	padding: 15px;
	position : relative;
	border: 2px solid #bad8e9;
	margin : 0px 6px 10px 4px;
	font-family: 'Jua', sans-serif;
}

.container-info:hover{
	font-weight: bold;
	box-shadow: 1px 1px 20px #ddd;
	cursor: pointer;
}

.container-info ul{
	list-style: none;
	padding-left:5px; 
	padding : 15px;
}

.container-info li{
	text-align: center;
}

.container {
	width: 1000px;
	margin: 0 auto;
	overflow: hidden;
}

.imgUpload {
	float: left;
	width: 100%;
	height: 230px;
	margin-bottom: 25px;
}

.gQuantity {
	color: #969696;
	font-size: 0.88rem;
}


/* 미디어쿼리 */
@media screen and (max-width: 767px) {
	.container-info {
		width: 80%;
	}
}

@media screen and (min-width: 768px) and (max-width: 959px) {
	.container-info {
		width: 50%;
	}
}

</style>
</head>
<body>

	<div class="container">
		<c:if test="${empty list}">
			상품이 존재하지 않습니다.
		</c:if>

		<c:if test="${not empty list}">
			<c:set var="count" value="1" />
			<c:forEach var="gdto" items="${list}">
				<c:if test="${gdto.gState eq 1}">
					<div class="container-info" onclick="location.href='goodsBuyPage?gIdx=${gdto.gIdx}'">
						<img src="${pageContext.request.contextPath}/${gdto.gImage}"
							class="imgUpload">
						<ul>
							<li><h3>${gdto.gName }</h3></li>
							<li>${gdto.gPrice }point</li>
							<li><span class="gQuantity">${gdto.gQuantity }개 남음</span></li>
						</ul>
					</div>
				</c:if>
			</c:forEach>
		</c:if>
	</div>

</body>
</html>