package com.koreait.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.koreait.dto.MemberDto;
import com.koreait.mybatis.config.DBService;

public class MemberDao {
	
	// Field
	private SqlSessionFactory factory = null;
	
	// Singleton
	private MemberDao() {
		factory = DBService.getFactory();
	}
	private static MemberDao dao = new MemberDao();
	public static MemberDao getInstance() {
		return dao;
	}
	
	// Method
	public List<MemberDto> getMemberList() {
		SqlSession sqlSession = factory.openSession();
		List<MemberDto> list = sqlSession.selectList("list");
		sqlSession.close();
		return list;
	}
	
}