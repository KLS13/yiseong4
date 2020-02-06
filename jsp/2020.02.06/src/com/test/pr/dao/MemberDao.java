package com.test.pr.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.test.pr.dto.MemberDto;

public class MemberDao {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private MemberDao() { }
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	
	public List<MemberDto> getAllMember() {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		try {
			conn = getConnect();
			String sql = "SELECT * FROM MEMBER ORDER BY IDX";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				MemberDto dto = new MemberDto();
				dto.setIdx(rs.getString(1));
				dto.setId(rs.getString(1));
				dto.setPw(rs.getString(1));
				dto.setName(rs.getString(1));
				dto.setAge(rs.getString(1));
				dto.setAddr(rs.getString(1));
				dto.setReg_date(rs.getString(1));
				list.add(dto);
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if ( rs != null ) rs.close();
				if ( ps != null ) ps.close();
				if ( conn != null ) conn.close();
			}catch(Exception e) {
			}
		}
		return list;
	}

	private Connection getConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String user = "james";
			String password = "bond";
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			conn = DriverManager.getConnection(url, user, password);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
