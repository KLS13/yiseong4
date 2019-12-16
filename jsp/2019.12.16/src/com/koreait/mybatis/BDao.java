package com.koreait.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class BDao {

	private SqlSessionFactory factory = null;
	
	private BDao() {
		factory = DBService.getFactory();
	}
	private static BDao dao = new BDao();
	public static BDao getInstance() {
		return dao;
	}
	

	public int getInsert(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);	// sqlSession 생성
		int result = sqlSession.insert("insert_bbs", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		return result;
	}
	
	public List<BDto> getList() {
		SqlSession sqlSession = factory.openSession();
		List<BDto> list = sqlSession.selectList("list_bbs");
		return list;
		// return sqlSession.selectList("list_bbs");
	}
	
	public BDto getBBS(String b_idx) {
		SqlSession sqlSession = factory.openSession();
		BDto bdto = sqlSession.selectOne("bbs_by_idx", Integer.parseInt(b_idx));
		return bdto;
		// return sqlSession.selectOne("bbs_by_idx", Integer.parseInt(b_idx));
	}
	
	public int getUpdate(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_bbs", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		return result;
	}
	
	public int getRemove(int b_idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("remove_bbs", b_idx);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		return result;
	}
	
	public int getUpdateHit(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_hit", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		return result;
	}
}




