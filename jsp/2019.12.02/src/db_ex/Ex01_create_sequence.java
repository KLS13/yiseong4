package db_ex;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex01_create_sequence {

	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "create sequence member_seq start with 1 increment by 1";
			ps = conn.prepareStatement(sql);
			ps.execute();
			System.out.println("member_seq 시퀀스가 생성되었습니다.");
		}catch (Exception e) {
			e.printStackTrace();
		}finally { 
			try {
				if( ps != null) { ps.close(); }
				if( conn != null) { conn.close(); }
			}catch (Exception e) {
				
			}
		}
	}

}
