package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex04_Insert_client {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String[] sqls = {
			"insert into client_t values(1, '철수', '서울 강남구', '660215-1234567', 3)",
"insert into client_t values(2, '영희', '대전 유성구', '760815-1234567', 4)",
"insert into client_t values(3, '영수', '서울 강서구', '791015-2345678', 10)",
"insert into client_t values(4, '영희', '인천 계양구', '911105-2234567', 10)",
"insert into client_t values(5, '희수', '서울 동작구', '860212-1111111', 1)",
"insert into client_t values(6, '희영', '서울 강북구', '801215-1223345', 10)",
"insert into client_t values(7, '이수', '경기 안양시', '770225-1234567', 9)",
"insert into client_t values(8, '효린', '경기 광명시', '850205-1234567', 8)",
"insert into client_t values(9, '홍두', '서울 강서구', '880215-1567899', 7)",
"insert into client_t values(10, '지희', '서울 강북구', '911115-2234567', 6)"
		};
		int result = 0;
		int count = 0;
		try {
			conn = DBConnect.getConnection();
			for ( String sql : sqls ) {
				ps = conn.prepareStatement(sql);
				result = ps.executeUpdate();
				if ( result > 0 ) {
					System.out.println("추가가 성공하였습니다. 현재 " + (count++) + "명");
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