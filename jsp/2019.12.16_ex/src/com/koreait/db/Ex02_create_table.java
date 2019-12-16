package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex02_create_table {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "create table member (" +
							"idx number not null primary key, " +
							"id varchar2(20) not null unique, " +
							"pw varchar2(20) not null, " +
							"name varchar2(20) not null, " +
							"age number, " +
							"addr varchar2(20), " +
							"reg_date date" +
						  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if( result != -1 ) {
				System.out.println("member 테이블이 생성되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if ( ps != null ) { ps.close(); }
				if ( conn != null ) { conn.close(); }
			} catch (Exception e) {
				
			}
		} // end try-catch-finally
		
	} // end main

} // end class