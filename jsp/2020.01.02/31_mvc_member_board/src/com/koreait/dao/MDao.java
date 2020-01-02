package com.koreait.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.MemberDto;
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
	
	// Method
	public MemberDto getMemberBymIdmPw(MemberDto mDto) {
		SqlSession sqlSession = factory.openSession();
		MemberDto dto = sqlSession.selectOne("select_by_mId_mPw", mDto);
		sqlSession.close();
		return dto;
	}
	
	public MemberDto getMemberBymEmail(String mEmail) {
		SqlSession sqlSession = factory.openSession();
		MemberDto dto = sqlSession.selectOne("select_by_mEail", mEmail);
		sqlSession.close();
		return dto;
	}
	
	public MemberDto getMemberBymIdmPhone(Map<String, String> map) {
		SqlSession sqlSession = factory.openSession();
		MemberDto dto = sqlSession.selectOne("select_by_mId_mPhone", map);
		sqlSession.close();
		return dto;
	}

}