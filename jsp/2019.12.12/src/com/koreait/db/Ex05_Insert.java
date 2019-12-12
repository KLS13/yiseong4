package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex05_Insert {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String[] sqls = {
			"insert into green values (green_seq.nextval, 'id01', '1111', 'james', 20, '서울', sysdate)",
			"insert into green values (green_seq.nextval, 'id02', '1111', 'alice', 21, '인천', sysdate)",
			"insert into green values (green_seq.nextval, 'id03', '1111', 'maria', 22, '경기', sysdate)",
			"insert into green values (green_seq.nextval, 'id04', '1111', 'misha', 23, '제주', sysdate)",
			"insert into green values (green_seq.nextval, 'id05', '1111', 'david', 24, '강원', sysdate)"
		};
		int result = 0;
		
		try {
			conn = DBConnect.getConnection();
			for ( String sql : sqls ) {
				ps = conn.prepareStatement(sql);
				result = ps.executeUpdate();
				if ( result > 0 ) {
					System.out.println("추가가 성공하였습니다.");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}