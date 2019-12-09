package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	
	// Method
	
	/*** 1. DB와 연결하기 ***/
	private Connection getConnection() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "james";
			String password = "BOND";
			conn = DriverManager.getConnection(url, user, password);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	/*** 2. green 테이블의 전체 목록을 리턴하는 getAllList() 메소드 ***/
	// GreenDto : 회원 1명
	// List<GreenDto> : 회원 여러 명
	public List<GreenDto> getAllList() {
		List<GreenDto> list = new ArrayList<GreenDto>();
		try {
			conn = getConnection();
			sql = "select * from green order by idx";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			// rs 에는 여러 개의 GreenDto 객체가 저장된 상태
			while ( rs.next() ) {
				GreenDto dto = new GreenDto();
				dto.setIdx( rs.getInt("idx") );
				dto.setId( rs.getString("id") );
				dto.setPw( rs.getString("pw") );
				dto.setName( rs.getString("name") );
				dto.setAge( rs.getInt("age") );
				dto.setAddr( rs.getString("addr") );
				dto.setReg_date( rs.getDate("reg_date") );
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				// TODO: handle exception
			}
		} // end try-catch-finally
		
		return list;
		
	} // end getAllList()
	
	
	/*** 3. green 테이블에서 전달된 id 에 해당하는 회원을 리턴하는 getOneList() 메소드 ***/
	public GreenDto getOneList(String id) {
		GreenDto dto = null;		// 검색에 성공하면 그 때 new 하고, 실패하면 null 을 그대로 리턴한다.
		try {
			conn = getConnection();
			sql = "select * from green where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			if ( rs.next() ) {					// 검색에 성공한 경우
				dto = new GreenDto();			// dto 생성
				dto.setIdx( rs.getInt(1) );		// dto 에 rs 값 채우기
				dto.setId( rs.getString(2) );
				dto.setPw( rs.getString(3) );
				dto.setName( rs.getString(4) );
				dto.setAge( rs.getInt(5) );
				dto.setAddr( rs.getString(6) );
				dto.setReg_date( rs.getDate(7) );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				// TODO: handle exception
			}
		} // end try-catch-finally
		
		return dto;
		
	} // end getOneList()

	
	/*** 4. 전달된 GreenDto 객체를 green 테이블에 삽입하고 그 결과를 리턴하는 getInsert() 메소드 ***/
	public int getInsert(GreenDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);		// 자동 커밋 방지
			sql = "insert into green values (green_seq.nextval, ?, ?, ?, ?, ?, sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getName());
			ps.setInt(4, dto.getAge());
			ps.setString(5, dto.getAddr());
			result = ps.executeUpdate();	// insert 문의 실행
			if ( result > 0 ) {				// insert 문이 성공하면,
				conn.commit();				// 수동 커밋 실행 (변경된 내용을 실제로 DB에 반영한다.)
			}
		} catch (Exception e) {
			e.printStackTrace();
			try {
				if ( conn != null) { conn.rollback(); }
			} catch (Exception e2) {
				// TODO: handle exception
			}
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) {
					conn.setAutoCommit(true);		// 자동 커밋 활성화
					conn.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} // end try-catch-finally
		
		return result;
		
	} // end getInsert()
	
	
	/*** 5. 전달된 GreenDto 객체를 green 테이블에서 삭제하고 그 결과를 리턴하는 getRemove() 메소드 ***/
	public int getRemove(GreenDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			sql = "delete from green where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			result = ps.executeUpdate();
			if ( result > 0 ) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) {
					conn.setAutoCommit(true);
					conn.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} // end try-catch-finally
		
		return result;
		
	} // end getRemove()
	
	
	/*** 6. 전달된 GreenDto 객체에 해당하는 데이터를 green 테이블에서 리턴하는 getUpdateView() 메소드 ***/
	public GreenDto getUpdateView(GreenDto dto) {
		GreenDto dto2 = null;
		try {
			conn = getConnection();
			sql = "select * from green where id = ? and pw = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPw());
			rs = ps.executeQuery();
			if ( rs.next() ) {					// 검색에 성공한 경우
				dto2 = new GreenDto();			// dto2 생성
				dto2.setIdx( rs.getInt(1) );	// dto2 에 rs 값 채우기
				dto2.setId( rs.getString(2) );
				dto2.setPw( rs.getString(3) );
				dto2.setName( rs.getString(4) );
				dto2.setAge( rs.getInt(5) );
				dto2.setAddr( rs.getString(6) );
				dto2.setReg_date( rs.getDate(7) );
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				// TODO: handle exception
			}
		} // end try-catch-finally
		
		return dto2;
		
	} // end getUpdateView()
	
	
	/*** 7. 전달된 GreenDto 객체에 해당하는 데이터를 green 테이블에서 수정하고 그 결과를 리턴하는 getUpdate() 메소드 ***/
	public int getUpdate(GreenDto dto) {
		int result = 0;
		try {
			conn = getConnection();
			conn.setAutoCommit(false);
			sql = "update green set pw = ?, name = ?, age = ?, addr = ? where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getName());
			ps.setInt(3, dto.getAge());
			ps.setString(4, dto.getAddr());
			ps.setString(5, dto.getId());
			result = ps.executeUpdate();
			if ( result > 0 ) {
				conn.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) {
					conn.setAutoCommit(true);
					conn.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		} // end try-catch-finally
		
		return result;
		
	} // end getUpdate()
	
}