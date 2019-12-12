package com.koreait.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class GuestbookDao {

	// Field
	private static SqlSession sqlSession = null;
	
	// singleton
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			// factory : DBService.getFactory()
			sqlSession = DBService.getFactory().openSession(false);
		}
		return sqlSession;
	}
	
	// Method
	// sqlSession 이 필요하면 위에서 정의한 getSqlSession() 메소드를 호출한다.
	
	// 전체 검색
	/* <select id = "select_all" resultType="com.koreait.mybatis.GuestbookDto">
	//     SELECT * FROM GUESTBOOK        -->> guestbook.xml 에서 작성하는 것
	 </select> */   
	public static List<GuestbookDto> selectAll() {
		return getSqlSession().selectList("select_all");
	}
	
	// 방명록 작성
	// <insert id = "insert">
	public static int getInsert(GuestbookDto dto) {
		int result = getSqlSession().insert("insert", dto);
		if ( result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
	
	// 방명록 보기
	/*
	  <select id = "select_by_idx">	 
	 */
	public static GuestbookDto selectById(String idx) {
		return getSqlSession().selectOne("select_by_idx", idx);
	}
	
	// 방명록 삭제
	// <delete id="remove_by_idx"
	public static int removeByIdx(int idx) {
		int result = getSqlSession().delete("remove_by_idx", idx);
		if(result > 0 ) {
			getSqlSession().commit();
		}
		return result;
	}
}














