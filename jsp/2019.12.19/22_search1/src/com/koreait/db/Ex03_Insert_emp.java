package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex03_Insert_emp {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String[] sqls = {
			"insert into emp_t values(1, 'james', '남자', 40, '부장', '1993-07-25', null, 4000)",
"insert into emp_t values(2, 'david', '남자', 20, '부장', '1988-02-25', null, 4000)",
"insert into emp_t values(3, 'alice', '여자', 20, '대리', '1998-03-25', 2, 3500)",
"insert into emp_t values(4, 'john', '남자', 20, '사원', '2001-03-15', 3, 2400)",
"insert into emp_t values(5, 'kim', '남자', 10, '부장', '1984-07-25', null, 4000)",
"insert into emp_t values(6, 'choi', '남자', 10, '사원', '2001-04-30', 4, 2000)",
"insert into emp_t values(7, 'samanda', '여자', 30, '과장', '2004-05-25', 10, 3900)",
"insert into emp_t values(8, 'tom', '남자', 40, '과장', '1993-08-15', 1, 3000)",
"insert into emp_t values(9, 'jessica', '여자', 20, '대리', '1997-11-25', 8, 3200)",
"insert into emp_t values(10, 'arnold', '남자', 10, '대리', '1998-05-25', 4, 3300)"
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