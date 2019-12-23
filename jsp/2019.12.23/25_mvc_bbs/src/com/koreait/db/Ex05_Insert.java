package com.koreait.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class Ex05_Insert {

	public static void main(String[] args) {

		Connection conn = null;
		PreparedStatement ps = null;
		String[] sqls = {
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자1', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자2', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자3', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자4', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자5', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자6', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자7', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자8', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자9', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자10', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자11', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자12', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자13', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자14', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자15', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자16', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자17', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자18', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자19', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자20', '공지1', '공지입니다.', '1111', 0, sysdate)",
			"insert into bbs_t (b_idx, writer, title, content, pw, hit, reg_date) values (bbs_seq.nextval, '작성자21', '공지1', '공지입니다.', '1111', 0, sysdate)"
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