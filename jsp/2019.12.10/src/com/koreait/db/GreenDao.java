package com.koreait.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class GreenDao {

	// Field
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private String sql = null;
	
	// Singleton
	private GreenDao() { }
	private static GreenDao dao = new GreenDao();
	public static GreenDao getInstance() {
		return dao;
	}
	
	// DBCP 설정
	private static DataSource ds;
	static {
		try {
			// javax.naming.Context
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
			// tomcat 에서는 "java:comp/env/" 를 추가한다.
			// jdbc/oracle 이라는 Resource name 을 찾아서 DataSource 객체에 전달한다.
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	// DB 연결 : 새로운 DataSource 로 인해 더 이상 사용되지 않는다.
	/*
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "james";
			String password = "bond";
			conn = DriverManager.getConnection(url, user, password);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	*/
	// select 문 닫기
	// 메소드명 : close1()
	// 매개변수 : ResultSet, PreparedStatement, Connection
	// 리터타입 : 없음
	private void close1(ResultSet rs, PreparedStatement ps, Connection conn) {
		try {
			if ( rs != null ) { rs.close(); }
			if ( ps != null ) { ps.close();}
			if ( conn != null) { conn.close(); } // 커넥션 반납
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// insert/update/delete 문 닫기
		// 메소드명 : close2()
		// 매개변수 : ResultSet, PreparedStatement, Connection
		// 리터타입 : 없음
		private void close2(PreparedStatement ps, Connection conn) {
			try {
				if ( ps != null ) { ps.close();}
				if ( conn != null) {
					conn.setAutoCommit(true); // 자동 커밋 활성화
					conn.close(); // 커넥션 반납
					} 
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	// 전체 목록 보기
	// 메소드명 : getAllList()
	// 매개변수 : 없음
	// 리턴타입 : List<GreenDto>
	public List<GreenDto> getAllList() {
		
		List<GreenDto> list = new ArrayList<GreenDto>();
		
		try {
			// conn = getConnection();  이전 커넥션 방식
			conn = ds.getConnection();
			sql = "select * from green order by reg_date desc";	// 최근 가입자가 먼저 출력
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();	// executeQuery() : select 문 전용 메소드
			// 검색된 결과(회원들) : rs 에 저장
			// rs -> GreenDto -> list
			while ( rs.next() ) {
				GreenDto dto = new GreenDto();
				dto.setIdx( rs.getInt("idx") );
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setReg_date(rs.getDate("reg_date"));
				list.add(dto);
			}
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {
			close1(rs, ps, conn);
		} // end try-catch-finally
		return list;
	} // end getAllList();
	
	
	// 회원 검색 ( by id )
	// 메소드명 : getOneList() 
	// 매개변수 : String id
	// 리턴타입 : GreenDto
	public GreenDto getOneList(String id) {
		GreenDto dto = null;
		
		try {
			conn = ds.getConnection();
			sql = "select * from green where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if( rs.next() ) {
				dto = new GreenDto();
				dto.setIdx( rs.getInt("idx"));
				dto.setId( rs.getString("id"));
				dto.setPw( rs.getString("pw"));
				dto.setName( rs.getString("name"));
				dto.setAge(rs.getInt("age"));
				dto.setAddr(rs.getString("addr"));
				dto.setReg_date(rs.getDate("reg_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close1(rs, ps, conn);
		} // end try-catch-finally
		return dto;
		
	}// end getOneList();
	// 회원 추가
	// 메소드명 : getInsert()
	// 매개변수 : GreenDto
	// 리턴타입 : int
	public int getInsert(GreenDto dto) {
		
		int result = 0;
		
		try {
			conn=ds.getConnection();
			conn.setAutoCommit(false);
			sql= "insert into green values ( green_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			result = ps.executeUpdate(); // select 문을 제외한 sql문 실행
			if(result > 0 ) { // sql 문 실행이 성공하면
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close2(ps, conn);
		}
		return result;
	}
	
	public int getRemove(GreenDto dto) {
		int result = 0;
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			sql = "delete from green where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			result = ps.executeUpdate();
			if ( result > 0 ) {
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close2(ps, conn);
		}
		return result;
	}
	
	// 회원 수정 페이지 열기
	// 메소드명 : getUpdateView()
	// 매개변수 : GreenDto ( 수정할 회원의 id, pw 정보만 담고 있다. )
	// 리턴타입 : GreenDto ( 검색된 회원의 전체 정보를 담고 있다. )
	public GreenDto getUpdateView(GreenDto dto) {
		GreenDto dto2 = null;
		try {
			conn = ds.getConnection();
			sql = "select * from green where id=? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			rs = ps.executeQuery();
			if(rs.next()) {
				dto2 = new GreenDto();
				dto2.setIdx( rs.getInt("idx"));
				dto2.setId( rs.getString("id"));
				dto2.setPw( rs.getString("pw"));
				dto2.setName( rs.getString("name"));
				dto2.setAge(rs.getInt("age"));
				dto2.setAddr(rs.getString("addr"));
				dto2.setReg_date(rs.getDate("reg_date"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close1(rs, ps, conn);
			
		}
		return dto2;
	}
	
	//회원 정보 수정
	
	public int getUpdate(GreenDto dto) {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			sql = "update green set pw=?, name= ? , age=?, addr=? where id =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getId());
			result = ps.executeUpdate();
			if(result >0) {
				conn.commit();
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close2(ps, conn);
		}         
		return result;
	}
}
	














