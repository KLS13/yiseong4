package com.koreait.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.Mdto;
import com.koreait.mybatis.config.DBService;

public class MDao {

	// Field
	private SqlSessionFactory factory = null;
	
	// Singleton
	private MDao() {
		factory = DBService.getFactory();
	}
	private static MDao dao = new MDao();
	public static MDao getInstance() {
		return dao;
	}
	
	public Mdto getMemberBymId(String mId) {
		SqlSession sqlSession = factory.openSession();
		Mdto dto = sqlSession.selectOne("select_by_mId", mId);
		sqlSession.close();
		return dto;
	}
	
	public int getInsertJoin(Mdto mDto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("insert_join",mDto);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}	
	
	public Mdto getMemberLogin(Mdto mdto) {
		SqlSession sqlSession = factory.openSession();
		Mdto dto = sqlSession.selectOne("select_login", mdto);
		sqlSession.close();
		return dto;
	}
	
	public int getUpdatePoint(String mId) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_point",mId);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}	
	
	public int getDeleteMember(String mId) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("delete_member",mId);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}	
	
	public int getUpdateMember(Mdto mDto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_member",mDto);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}	
	
}