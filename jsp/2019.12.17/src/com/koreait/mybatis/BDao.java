package com.koreait.mybatis;

import java.util.List;
import java.util.Map;

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
		sqlSession.close();
		return result;
	}
	
	public List<BDto> getList(Map<String, Integer> map) {
		SqlSession sqlSession = factory.openSession();
		List<BDto> list = sqlSession.selectList("list_bbs",map);
		sqlSession.close();
		return list;
		// return sqlSession.selectList("list_bbs");
	}
	
	public BDto getBBS(String b_idx) {
		SqlSession sqlSession = factory.openSession();
		BDto bdto = sqlSession.selectOne("bbs_by_idx", Integer.parseInt(b_idx));
		sqlSession.close();
		return bdto;
		// return sqlSession.selectOne("bbs_by_idx", Integer.parseInt(b_idx));
	}
	
	public int getUpdate(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_bbs", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getRemove(int b_idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("remove_bbs", b_idx);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getUpdateHit(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_hit", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getTotalRecord( ) {
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.selectOne("total_record"); // count 숫자 하나만 나오기 떄문에 셀렉트원 !
		sqlSession.close();
		return result;
		
	}
	
	public int getInsertComment(CDto cdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert_comment", cdto);
		if(result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	public List<CDto> getCommentList(int b_idx) {
		SqlSession sqlSession = factory.openSession();
		List<CDto> cList = sqlSession.selectList("list_comment", b_idx);
		sqlSession.close();
		return cList;
	}
	public int getRemoveComment(int c_idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("remove_comment", c_idx);
		if(result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
}




