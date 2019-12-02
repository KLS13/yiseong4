package db_ex;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex03_insert {

	public static void main(String[] args) {
		
		Connection conn = null;
		PreparedStatement ps = null;
		
		try {
			conn = DBConnect.getConnection();
			String sql = "insert into member values (member_seq.nextval, 'admin', '1111', '관리자', 50, '서울', sysdate)";
			ps = conn.prepareStatement(sql);
			int count = ps.executeUpdate();
			System.out.println(count > 0 ? "성공" : "실패");
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
