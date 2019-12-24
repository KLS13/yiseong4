package com.koreait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.BDto;
import com.koreait.dto.CDto;
import com.koreait.mybatis.config.DBService;

public class BDao {

	// Field
	private SqlSessionFactory factory = null;
	
	// Singleton
	private BDao() {
		factory = DBService.getFactory();
	}
	private static BDao dao = new BDao();
	public static BDao getInstance() {
		return dao;
	}
	
	// Method
	public List<BDto> getBBSList(Map<String, Integer> map) {
		SqlSession sqlSession = factory.openSession();
		List<BDto> list = sqlSession.selectList("select_by_map", map);
		sqlSession.close();
		return list;
	}
	
	public BDto getBBS(int b_idx) {
		SqlSession sqlSession = factory.openSession();
		BDto bdto = sqlSession.selectOne("select_by_idx", b_idx);
		sqlSession.close();
		return bdto;
	}
	
	public int getInsert(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getUpdateWithFile(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_with_file", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getUpdateWithoutFile(BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_without_file", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getRemove(int b_idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("remove", b_idx);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getTotalRecordCount() {
		SqlSession sqlSession = factory.openSession();
		int count = sqlSession.selectOne("total_count_of_bbs");
		sqlSession.close();
		return count;
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
	
	public int getInsertComment(CDto cdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert_comment", cdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public List<CDto> getCommentList(int b_idx) {
		SqlSession sqlSession = factory.openSession();
		List<CDto> list = sqlSession.selectList("select_by_b_idx", b_idx);
		sqlSession.close();
		return list;
	}
	
	public int getRemoveComment(int c_idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("remove_comment", c_idx);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}