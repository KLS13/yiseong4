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
			sql = "create table member_t (" +
					"mIdx number not null, " +
					"mId varchar2(50) not null primary key, " +
					"mPw varchar2(50), " +
					"mName varchar2(50), " +
					"mEmail varchar2(50) not null unique, " +
					"mPhone varchar2(50), " +
					"mReg_date date," + 
					"mPoint number)";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("member_t 테이블 생성 성공.");
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