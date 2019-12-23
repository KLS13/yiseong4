package com.koreait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.BDto;
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
	public List<BDto> getBBSList() {
		SqlSession sqlSession = factory.openSession();
		List<BDto> list = sqlSession.selectList("select_all_bbs");
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
	
	public int getUpdateWithFile (BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("update_with_file", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	public int getUpdateWithOutFile (BDto bdto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("update_without_file", bdto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	public int getRemove(int b_idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("remove", b_idx);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
}