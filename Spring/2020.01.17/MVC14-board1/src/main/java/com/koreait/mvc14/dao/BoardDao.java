package com.koreait.mvc14.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.PreparedStatementSetter;

import com.koreait.mvc14.dto.BoardDto;
import com.koreait.mvc14.util.Constant;

public class BoardDao {
	
	// Field
	private JdbcTemplate template = null;
	
	// Constructor (생성할 때 연결되도록 처리한다.)
	public BoardDao() {
		this.template = Constant.template;
	}
	
	// Method
	
	// BoardListCommand
	public ArrayList<BoardDto> list() {
		String sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1";
		return (ArrayList<BoardDto>) template.query(sql, new BeanPropertyRowMapper<BoardDto>(BoardDto.class));
	} // end list() method
	

	// BoardViewCommand
	public BoardDto view(String strbIdx) { // db는 int이지만, request로 넘어오면 String
		String sql = "select bIdx, bWriter, bTitle, bContent, bDate from board1 where bIdx=" + strbIdx;
		return template.queryForObject(sql, new BeanPropertyRowMapper<BoardDto>(BoardDto.class));		
	} // end view() method
	
	
	// BoardModifyCommand
	public void modify(final BoardDto bDto) { // 매개변수에 해킹 시도가 있었다. 그 뒤로 final 을 붙여야 사용할 수 있다.
		String sql = "update board1 set bTitle=?, bContent=? where bIdx=?";
		template.update(sql, new PreparedStatementSetter() {
			@Override
			public void setValues(PreparedStatement ps) throws SQLException {
				ps.setString(1, bDto.getbTitle());
				ps.setString(2, bDto.getbContent());
				ps.setInt(3, bDto.getbIdx());
			}
		});
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
	}
		
		
		
	// BoardWriteCommand
	public void write(final String bWriter, final String bTitle, final String bContent) {
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
	} // end delete() method
	
}