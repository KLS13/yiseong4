<%@page import="db_ex.DBConnect"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 수정</title>
<script type="text/javascript">
	function update_go( f ) {
		if ( f.pw.value == "" ||
			 f.name.value == "" || 
			 f.age.value == "" ||
			 f.addr.value == "" ) {
			alert("모든 정보를 입력한 뒤 수정하세요.");
			return;
		}
		f.action = "/04_DB_02/update_go.jsp";
		f.submit();
	}
</script>
</head>
<body>

	<%@ include file="index.jsp" %>
	
	<br /><hr /><br />

	<%
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "select * from member where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			if ( rs.next() ) { %>
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
								<td><input type="text" name="idx" value="<%=rs.getInt(1) %>" readonly /></td>
								<td><input type="text" name="id" value="<%=rs.getString(2) %>" readonly /></td>
								<td><input type="password" name="pw" value="<%=rs.getString(3) %>" /></td>
								<td><input type="text" name="name" value="<%=rs.getString(4) %>" /></td>
								<td><input type="text" name="age" value="<%=rs.getInt(5) %>" /></td>
								<td><input type="text" name="addr" value="<%=rs.getString(6) %>" /></td>
								<td><input type="text" name="reg_date" value="<%=rs.getDate(7) %>" readonly /></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="7">
									<input type="button" value="수정" onclick="update_go(this.form)" />&nbsp;&nbsp;
									<input type="reset" value="다시 작성" />
								</th>
							</tr>
						</tfoot>
					</table>
				</form>
			<% } else {
				out.println("찾는 회원이 없습니다.");
			}
		} catch (Exception e) {
			response.sendRedirect("/04_DB_02/view_all.jsp");
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				
			}
		}
	%>
	
</body>
</html>