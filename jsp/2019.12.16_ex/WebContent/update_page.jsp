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
<title>member 수정</title>
<script type="text/javascript">
	function update( f ) {
		if ( f.pw.value == "" ||
			 f.name.value == "" || 
			 f.age.value == "" ||
			 f.addr.value == "" ) {
			alert("모든 정보를 입력한 뒤 수정하세요.");
			return;
		}
		f.action = "update.jsp";
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
		String sql = null;
		
		try {
			conn = DBConnect.getConnection();
			sql = "select * from member where id = ? and pw = ?";	// DB에서 id 는 unique 처리가 되어 있기 때문에 실행 결과는 반드시 1개 이하의 결과 집합이다. 
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, pw);
			rs = ps.executeQuery();	// select 문의 실행 결과는 실제로 검색될 결과 집합(ResultSet) 이다. (RecordSet과 같은 개념이다.)
			if ( rs.next() ) { %>	<!-- rs.next() 를 통해 검색된 결과 집합이 있는지 확인한다. 있으면 true 없으면 false 를 리턴한다. -->
				<div>
					<form method="post">
						<table>
							<tbody>
								<tr>
									<th>순번</th>
									<td><%=rs.getInt(1) %></td>
									<!-- rs.getInt(1) 는 첫 번째 필드의 값을 의미한다. 첫 번째 필드가 idx 필드이므로 rs.getInt("idx")로도 호출할 수 있다. -->
								</tr>
								<tr>
									<th>아이디</th>
									<td><%=rs.getString(2) %></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="password" name="pw" value="<%=rs.getString(3) %>" /></td>
								</tr>
								<tr>
									<th>성명</th>
									<td><input type="text" name="name" value="<%=rs.getString(4) %>" /></td>
								</tr>
								<tr>
									<th>나이</th>
									<td><input type="text" name="age" value="<%=rs.getInt(5) %>" /></td>
								</tr>
								<tr>
									<th>주소</th>
									<td><input type="text" name="addr" value="<%=rs.getString(6) %>" /></td>
								</tr>
								<tr>
									<th>가입일</th>
									<td><%=rs.getDate(7) %></td>
								</tr>
							</tbody>
							<tfoot>
								<tr>
									<th colspan="2">
										<input type="button" value="수정내용 저장하기" onclick="update(this.form)" />&nbsp;&nbsp;
										<input type="reset" value="다시 작성" />&nbsp;&nbsp;
										<input type="button" value="되돌아가기" onclick="history.back()" />
									</th>
								</tr>
							</tfoot>
						</table>
					</form>
				</div>
			<% } else {
					out.println("찾는 회원이 없습니다.");	// rs.next() 의 결과가 false 인 경우, 즉 찾은 결과가 없는 경우이다.
			   }
			} catch (Exception e) {
				response.sendRedirect("view_all.jsp");
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