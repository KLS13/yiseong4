<%@page import="com.db.GreenDao"%>
<%@page import="com.db.GreenDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		// 파라미터를 이용해서 GreenDto 객체를 생성하고,
		// 해당 객체를 전달하면 green 테이블에서 해당하는 회원을 반환하는 getUpdateView() 메소드 호출
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		GreenDto dto = new GreenDto();
		dto.setId(id);
		dto.setPw(pw);
		
		GreenDto dto2 = GreenDao.getInstance().getUpdateView(dto);
	%>
	
	<div>
		<h1><%=id %> 회원의 정보</h1>
		<form method="post">
			<table>
				<thead>
					<tr>
						<th>순번</th>
						<th>아이디</th>
						<th>비밀번호</th>
						<th>성명</th>
						<th>나이</th>
						<th>주소</th>
						<th>가입일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<% if ( dto2 != null ) { %>
							<td><%=dto2.getIdx() %><input type="hidden" name="idx" value="<%=dto2.getIdx() %>" /></td>
							<td><%=dto2.getId() %><input type="hidden" name="id" value="<%=dto2.getId() %>" /></td>
							<td><input type="password" name="pw" value="<%=dto2.getPw() %>" /></td>
							<td><input type="text" name="name" value="<%=dto2.getName() %>" /></td>
							<td><input type="text" name="age" value="<%=dto2.getAge() %>" /></td>
							<td><input type="text" name="addr" value="<%=dto2.getAddr() %>" /></td>
							<td><%=dto2.getReg_date() %><input type="hidden" name="reg_date" value="<%=dto2.getReg_date() %>" /></td>
						<% } else { %>
							<td colspan="7"><%=id %> 회원의 정보가 없습니다.</td>
						<% } %>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="7">
							<% if ( dto2 != null ) { %>
								<input type="button" value="회원 정보 수정" onclick="update(this.form)" />&nbsp;&nbsp;
								<input type="reset" value="다시 작성" />&nbsp;&nbsp;
							<% } %>
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
</body>
</html>