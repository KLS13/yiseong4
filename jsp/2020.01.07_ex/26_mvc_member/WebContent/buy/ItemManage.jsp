<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<h1> 물품 등록 하기 </h1>

<form method="post" action='/26_mvc_member/ItemManage.do'>
	
	<table border="1">
		<tr>
			<td>제품명</td>
			<td><input type="text" name="item"/></td>
		</tr>
		<tr>
			<td>가격</td>
			<td><input type="text" name="price"/></td>
		</tr>
		<tr>
			<td>재고</td>
			<td><input type="text" name="ea"/></td>
		</tr>
	</table>
	
	<input type="submit" value="상품등록" />
	
</form>