package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex03_create_sequence {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "create sequence board_seq start with 1 increment by 1";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("board_seq 시퀀스 생성 성공.");
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