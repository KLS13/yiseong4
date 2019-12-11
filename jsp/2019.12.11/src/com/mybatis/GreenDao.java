package com.mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

public class GreenDao {
	
	//필드
	private SqlSessionFactory factory = null;
	
	//sigleton
	private GreenDao() {
		factory = DBService.getFactory();
	}
	
	private static GreenDao dao = new GreenDao();
	public static GreenDao getInstance() {
		return dao;
	}
	
	//method
	// 전체 검색
	public List<GreenDto> selectAll() {
		
			SqlSession sqlSession = factory.openSession();
			List<GreenDto> list = sqlSession.selectList("select_all");
			sqlSession.close();
			return list;
	}
	
	// 아이디로 검색
	public GreenDto selectById(String id) {
		SqlSession sqlSession = factory.openSession();
		GreenDto dto = sqlSession.selectOne("select_by_id", id);
		sqlSession.close();
		return dto;
	}
	
	public GreenDto selectById(GreenDto dto) {
		SqlSession sqlSession = factory.openSession();
		GreenDto dto2 = sqlSession.selectOne("select_by_id", dto);
		sqlSession.close();
		return dto2;
	}
	
	// 회원 삽입
	public int insert(GreenDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert", dto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int remove(GreenDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("remove", dto);
		if( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int update(GreenDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update", dto);
		if( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
}
