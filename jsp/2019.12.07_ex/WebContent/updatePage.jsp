<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<style type="text/css">
	table {
		width: 400px;
		height: 150px;
		margin: auto;
		border-collapse: collapse;
	}
	th, td {
		border: 1px solid black;
		padding: 10px;
	}
</style>
<script type="text/javascript">
	function update_go( f ) {
		if ( f.pw.value == "" ) {
			alert("새 비밀번호를 입력하세요.");
			f.pw.focus();
			return;
		} else if ( f.pw.value != f.pw2.value ) {
			alert("비밀번호 입력을 확인하세요.");
			return;
		}
		f.action = "update.jsp";
		f.submit();
	}
</script>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	String sql = null;
	
	try {
		conn = DBConnect.getConnection();
		sql = "select * from green where id = ?";
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		rs = ps.executeQuery();
		if ( rs.next() ) { %>
			<form method="post">
				<table>
					<thead>
						<tr>
							<th colspan="2">개인정보 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>아이디</td>
							<td><%=id%><input type="hidden" name="id" value="<%=id%>" /></td>
						</tr>
						<tr>
							<td>새 비밀번호</td>
							<td><input type="password" name="pw" /></td>
						</tr>
						<tr>
							<td>비밀번호 확인</td>
							<td><input type="password" name="pw2" /></td>
						</tr>
						<tr>
							<td>성명</td>
							<td><input type="text" name="name" value="<%= rs.getString("name") %>" /></td>
						</tr>
						<tr>
							<td>주소</td>
							<td>
								<select name="addr">
									<% if ( rs.getString("addr").equals("서울") ) { %>
										<option value="서울" selected>서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="부산">부산</option>
										<option value="제주">제주</option>
									<% } else if ( rs.getString("addr").equals("경기") ) { %>
										<option value="서울">서울</option>
										<option value="경기" selected>경기</option>
										<option value="인천">인천</option>
										<option value="부산">부산</option>
										<option value="제주">제주</option>
									<% } else if ( rs.getString("addr").equals("인천") ) { %>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천" selected>인천</option>
										<option value="부산">부산</option>
										<option value="제주">제주</option>
									<% } else if ( rs.getString("addr").equals("부산") ) { %>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="부산" selected>부산</option>
										<option value="제주">제주</option>
									<% } else if ( rs.getString("addr").equals("제주") ) { %>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="부산">부산</option>
										<option value="제주" selected>제주</option>
									<% } else { %>
										<option value="서울">서울</option>
										<option value="경기">경기</option>
										<option value="인천">인천</option>
										<option value="부산">부산</option>
										<option value="제주">제주</option>
									<% } %>
								</select>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr>
							<td colspan="2" style="text-align: center">
								<input type="button" value="돌아가기" onclick="location.href='manager.jsp'" /> 
								<input type="button" value="수정" onclick="update_go(this.form)" /> 
								<input type="reset" value="취소" />
							</td>
						</tr>
					</tfoot>
				</table>
			</form>
	<% } // end if
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			if (rs != null) { rs.close(); }
			if (ps != null) { ps.close(); }
			if (conn != null) { conn.close(); }
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>

</body>
</html>