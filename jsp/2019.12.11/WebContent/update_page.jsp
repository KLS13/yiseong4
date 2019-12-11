<%@page import="com.mybatis.GreenDao"%>
<%@page import="com.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@page import="org.apache.ibatis.session.SqlSessionFactory"%>
<%@page import="com.mybatis.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script type="text/javascript">
	function update( f ) {
		if ( f.pw.value == "" ) {
			alert("검색할 회원의 비밀번호를 먼저 입력하세요.");
			f.pw.focus();
			return;
		}
		if ( f.name.value == "" ) {
			alert("검색할 회원의 성명을 먼저 입력하세요.");
			f.name.focus();
			return;
		}
		if ( f.age.value == "" ) {
			alert("검색할 회원의 나이를 먼저 입력하세요.");
			f.age.focus();
			return;
		}
		if ( f.addr.value == "" ) {
			alert("검색할 회원의 주소를 먼저 입력하세요.");
			f.addr.focus();
			return;
		}
		f.action = "update.jsp";
		f.submit();
	}
</script>
</head>
<body>
	
	<jsp:include page="index.jsp" />
	<br /><hr /><br />
	
	<%
		request.setCharacterEncoding("utf-8");
		GreenDto dto = new GreenDto();
		dto.setId( request.getParameter("id") );
		dto.setPw( request.getParameter("pw") );
		
		GreenDao dao = GreenDao.getInstance();
		GreenDto dto2 = dao.selectById(dto);
		pageContext.setAttribute("dto2", dto2);
	%>
	
	<div>
		<h1>${param.id } 회원의 정보</h1>
		<form method="post">
			<table>
				<tbody>
					<c:if test="${dto2 ne null }">
						<tr>
							<td>순번</td>
							<td>${dto2.idx }<input type="hidden" name="idx" value="${dto2.idx }" /></td>
						</tr>
						<tr>
							<td>아이디</td>
							<td>${dto2.id }<input type="hidden" name="id" value="${dto2.id }" /></td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td><input type="password" name="pw" value="${dto2.pw }" size="50" /></td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text" name="name" value="${dto2.name }" size="50" /></td>
						</tr>
						<tr>
							<td>나이</td>
							<td><input type="text" name="age" value="${dto2.age }" size="50" /></td>
						</tr>
						<tr>
							<td>주소</td>
							<td><input type="text" name="addr" value="${dto2.addr }" size="50" /></td>
						</tr>
						<tr>
							<td>가입일</td>
							<td>${dto2.reg_date }<input type="hidden" name="reg_date" value="${dto2.reg_date }" /></td>
						</tr>
					</c:if>
					<c:if test="${dto2 eq null }">
						<tr>
							<td colspan="2">${param.id } 회원의 정보가 없습니다.</td>
						</tr>
					</c:if>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="2">
							<c:if test="${dto2 ne null }">
								<input type="button" value="회원 정보 수정" onclick="update(this.form)" />&nbsp;&nbsp;
								<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							</c:if>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<% //sqlSession.close(); %>
	
</body>
</html>