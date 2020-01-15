package com.koreait.mvc10.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.koreait.mvc10.dto.BoardDto;

public class BoardDao {

	// 필드
	private DataSource ds;

	// 생성할 때 연결되도록 처리
	public BoardDao() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/spring"); // tomcat 위치 --> java:comp/env
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 메소드

	// BoardListCommand
	public ArrayList<BoardDto> list() {

		// 무조건 메소드별로 커넥션을 열고 닫는 것이 좋다.

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();

		try {
			// DataSource ds : 커넥션 풀을 관리하는 객체
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
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try;
		return list;
	} // end list() method;

	// BoardViewCommand
	public BoardDto view(String strbIdx) { // db는 int이지만, request로 넘어오면서 String

		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = null;
		BoardDto bDto = null;

		try {
			// DataSource ds : 커넥션 풀을 관리하는 객체
			conn = ds.getConnection();
			sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1 where bidx=?";
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
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try;
		return bDto;
	}

	public void modify(BoardDto bDto) {
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
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try;
	}// end modify
	
	//BoardDeleteCommand
	public void delete(String strbIdx) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;

		try {
			conn = ds.getConnection();
			sql = "delete from board1 where bIdx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt( 1, Integer.parseInt(strbIdx) );
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try;
	} // end delete()
	
	// BoardWriteCommand
	public void write(String bWriter, String bTitle, String bContent) {
		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;

		try {
			conn = ds.getConnection();
			sql = "insert into board1(bWriter, bTitle, bContent, bDate) values(?,?,?,now())";
			ps = conn.prepareStatement(sql);
			ps.setString(1, bWriter);
			ps.setString(2, bTitle);
			ps.setString(3, bContent);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		} // end try;
	}
}

