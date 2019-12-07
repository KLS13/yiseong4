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
			sql = "create table green (" +
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
			if ( result != -1 ) {
				System.out.println("green 테이블 생성 성공.");
			} else {
				System.out.println("green 테이블 생성 실패.");
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