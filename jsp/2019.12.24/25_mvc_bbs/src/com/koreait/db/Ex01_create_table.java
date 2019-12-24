package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex01_create_table {

	@SuppressWarnings("resource")
	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String sql = null;
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			sql = "create table bbs_t (" +
					"b_idx number constraint bbs_t_pk primary key, " +
					"writer varchar2(50) not null, " +
					"title varchar2(50) not null, " +
					"content clob, " +
					"pw varchar2(20), " +
					"hit number, " +
					"ip varchar2(15), " +
					"filename varchar2(100), " +
					"reg_date date" + 
				  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("bbs_t 테이블 생성 성공.");
			}
			sql = "create table comment_t (" +
					"c_idx number constraint comment_t_pk primary key, " +
					"writer varchar2(50) not null, " +
					"content clob, " +
					"pw varchar2(20), " +
					"ip varchar2(15), " +
					"reg_date date, " + 
					"b_idx number not null, " +
					"constraint comment_t_fk foreign key (b_idx) references bbs_t (b_idx)" +
					")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("comment_t 테이블 생성 성공.");
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