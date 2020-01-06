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
			sql = "create table member_t (" +
					"mId varchar2(30) constraint member_t_pk primary key, " +
					"mPw varchar2(30) not null, " +
					"mName varchar2(30) not null, " +
					"mEmail varchar2(30) not null unique, " +
					"mPhone varchar2(15), " +
					"mAddress varchar2(50), " +
					"mRegDate date" +
				  ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("member_t 테이블 생성 성공.");
			}
			sql = "create table board_t (" +
					"bIdx number constraint board_t_pk primary key, " +
					"mId varchar2(30) not null, " +
					"bTitle varchar2(50) not null, " +
					"bContent varchar2(2000), " +
					"bPw varchar2(20), " +
					"bIp varchar2(15), " +
					"bHit number default 0, " +
					"bPostDate date, " +
					"bRef number, " + 
					"bStep number, " +
					"bDepth number, " +
					"bDelete number, " +
					"constraint board_t_fk foreign key (mId) references member_t (mId)" +
				   ")";
			ps = conn.prepareStatement(sql);
			result = ps.executeUpdate();
			if ( result != -1 ) {
				System.out.println("board_t 테이블 생성 성공.");
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