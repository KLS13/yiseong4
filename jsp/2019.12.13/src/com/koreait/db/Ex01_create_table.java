package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex01_create_table {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "create table guestbook (" +
					"idx number not null primary key, " +
					"writer varchar2(20) not null, " +
					"email varchar2(20), " +
					"pw varchar2(20), " +
					"filename varchar2(100), " +
					"title varchar2(20) not null, " +
					"content varchar2(2000) not null, " +
					"reg_date date" + 
				  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("guestbook 테이블 생성 성공.");
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