package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex02_drop_table {

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "drop table comment_t";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("comment_t  테이블 삭제 성공.");
			}
			
			sql = "drop table bbs_t";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("bbs_t  테이블 삭제 성공.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}