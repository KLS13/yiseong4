package com.koreait.mvc13.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.koreait.mvc13.dto.BoardDto;
import com.koreait.mvc13.util.Constant;

public class BoardDao {
	
	// Field
	// private DataSource ds;
	private JdbcTemplate template = null;
	
	// Constructor (생성할 때 연결되도록 처리한다.)
	public BoardDao() {
		
		this.template = Constant.template;
		
		/*
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/mysql5");	// tomcat 위치 ->  java:comp/env
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
	}
	
	// Method
	
	// BoardListCommand
	public ArrayList<BoardDto> list() {
		
		String sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1";
		return (ArrayList<BoardDto>) template.query(sql, new BeanPropertyRowMapper<BoardDto>(BoardDto.class));
		
		// sql 을 실행하고 결과를 BoardDto 타입으로 하나씩 받아온다.
		// query 메소드는 결과가 여러 개인 경우에 사용한다.
		
		
		
		/*
		// 무조건 메소드별로 커넥션을 열고 닫는 것이 좋다.
		
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		
		try {
			// DataSource ds : 커넥션풀을 관리하는 객체
			conn = ds.getConnection();
			sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int bIdx = rs.getInt("bIdx");
				String bWriter = rs.getString("bWriter");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Timestamp bDate = rs.getTimestamp("bDate");
				BoardDto bDto = new BoardDto(bIdx, bWriter, bTitle, bContent, bDate);
				list.add(bDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try
		
		return list;
		*/
	} // end list() method
	

	// BoardViewCommand
	public BoardDto view(String strbIdx) { // db는 int이지만, request로 넘어오면 String
	
		// sql 이 바뀝니다.
		String sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1 where bIdx=" + strbIdx;
		return template.queryForObject(sql, new BeanPropertyRowMapper<BoardDto>(BoardDto.class));

		// queryForObject : 결과가 하나인 경우에 사용한다.
		// BoardDto 타입이 리턴되기 때문에 캐스팅이 필요 없다.
			
		
		
		/*
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		BoardDto bDto = null;
		
		try {
			// DataSource ds : 커넥션풀을 관리하는 객체
			conn = ds.getConnection();
			sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1 where bIdx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(strbIdx));
			rs = ps.executeQuery();
			if (rs.next()) {
				int bIdx = rs.getInt("bIdx");
				String bWriter = rs.getString("bWriter");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Timestamp bDate = rs.getTimestamp("bDate");
				bDto = new BoardDto(bIdx, bWriter, bTitle, bContent, bDate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( rs != null ) { rs.close(); }
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try
		
		return bDto;
		*/
		
	} // end view() method
	
	
	// BoardModifyCommand
	public void modify(final BoardDto bDto) { // 매개변수에 해킹 시도가 있었다. 그 뒤로 final 을 붙여야 사용할 수 있다.
		
		// sql 을 그대로 쓴다. (? 가 있는 모습 그대로 쓴다.)
		// insert, update, delete 문은 update 메소드를 사용한다.
		// ? 에 값을 전달하기 위해서 PreparedStatementSetter 클래스를 사용한다.
		// PreparedStatementSetter() : 괄호가 있는 Inner type 을 사용한다.
		String sql = "update board1 set bTitle=?, bContent=? where bIdx=?";
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// public void modify(BoardDto bDto)
				// 매개변수로 전달된 bDto 는 final 처리를 해야 사용이 가능하다.
				ps.setString(1, bDto.getbTitle());
				ps.setString(2, bDto.getbContent());
				ps.setInt(3, bDto.getbIdx());
			}
		});
		
		/*
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		
		try {
			conn = ds.getConnection();
			sql = "update board1 set bTitle=?, bContent=? where bIdx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bDto.getbTitle());
			ps.setString(2, bDto.getbContent());
			ps.setInt(3, bDto.getbIdx());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try
		*/
	} // end modify() method
	
	
	
	// BoardDeleteCommand
	public void delete(final String strbIdx) {
		
		String sql = "delete from board1 where bIdx=?";
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				// TODO Auto-generated method stub
				ps.setInt(1, Integer.parseInt(strbIdx));
			}
		});
		
		
		/*
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		
		try {
			conn = ds.getConnection();
			sql = "delete from board1 where bIdx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(strbIdx));
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try		
		*/
	} // end delete() method
	
	
	
	// BoardWriteCommand
	public void write(final String bWriter, final String bTitle, final String bContent) {
		
		// insert 문은 PreparedStatementCreator 를 전용으로 사용한다.
		
		template.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection con) throws SQLException {
				String sql = "insert into board1 (bWriter, bTitle, bContent, bDate) values (?, ?, ?, now()) ";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, bWriter);
				ps.setString(2, bTitle);
				ps.setString(3, bContent);
				return ps;
			}
		});
		
		
		/*
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		
		try {
			conn = ds.getConnection();
			sql = "insert into board1 (bWriter, bTitle, bContent, bDate) values (?, ?, ?, now()) ";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bWriter);
			ps.setString(2, bTitle);
			ps.setString(3, bContent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try		
		*/
	} // end delete() method
	
}