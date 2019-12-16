<%@page import="com.koreait.db.DBConnect"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	// 전달 받은 파라미터의 인코딩 처리 및 저장
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String addr = request.getParameter("addr");

	// DB 연결 및 처리를 위한 변수 선언
	Connection conn = null;
	PreparedStatement ps = null;
	int result = 0;
	String sql = null;
	
	// DB 연결 및 처리
	try {
		conn = DBConnect.getConnection();
		sql = "insert into member values (member_seq.nextval, ?, ?, ?, ?, ?, sysdate)";	// prepareStatement 에서 변수는 ? 로 처리한다.
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);	// 1번째 ? 에 id 를 전달한다.
		ps.setString(2, pw);	// 2번째 ? 에 pw 를 전달한다.
		ps.setString(3, name);	// 3번째 ? 에 name 을 전달한다.
		ps.setInt(4, Integer.parseInt(age));	// age는 DB에 number 타입으로 존재하므로 DB에 삽입할때는 int 형으로 타입을 바꿔서 처리한다.
		ps.setString(5, addr);	// 5번째 ? 에 addr 을 전달한다.
		result = ps.executeUpdate();	// 실행 결과는 실제로 처리된 레코드의 개수이다. 0 이 리턴되면 처리된 것이 없다는 의미로 DB 처리에 실패했다고 볼 수 있다.
		if ( result > 0 ) {
			response.sendRedirect("view_all.jsp");
			// DB가 수정된 뒤이기 때문에 redirect 처리해서 페이지를 이동한다.
			// 시스템의 변화가 생긴 경우 : redirect
			// 시스템의 변화가 없는 경우 : forward
		}
	} catch (Exception e) {
		response.sendRedirect("view_all.jsp");	// 예외가 발생하면 전체 목록을 보여준다.
	} finally {
		try {
			if ( ps != null ) { ps.close(); }
			if ( conn != null ) { conn.close(); }
		} catch (Exception e) {
			
		}
	}
%>