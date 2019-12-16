package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex03_insert {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "insert into member values (member_seq.nextval, 'admin', '1111', '관리자', 50, '서울', sysdate)";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result > 0 ) {
				System.out.println("회원이 추가되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				
			}
		} // end try

	}

}