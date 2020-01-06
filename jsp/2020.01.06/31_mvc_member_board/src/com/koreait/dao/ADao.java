package com.koreait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.MemberDto;
import com.koreait.mybatis.config.DBService;

public class ADao {

	// Field
	private SqlSessionFactory factory = null;
	
	// Singleton
	private ADao() {
		factory = DBService.getFactory();
	}
	private static ADao dao = new ADao();
	public static ADao getInstance() {
		return dao;
	}
	
	// Method
	public List<MemberDto> getAllMember() {
		SqlSession sqlSession = factory.openSession();
		List<MemberDto> list = sqlSession.selectList("select_all_member");
		sqlSession.close();
		return list;
	}
}