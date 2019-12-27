package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex06_delete {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "delete from member_t";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result > 0 ) {
				System.out.println("member_t 전체 회원 삭제가 성공하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) { ps.close(); }
				if (conn != null) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}