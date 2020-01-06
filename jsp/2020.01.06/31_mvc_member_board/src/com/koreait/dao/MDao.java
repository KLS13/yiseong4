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
	
	public int getUpdatemPw(Map<String, String> map) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_mPw",map);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public MemberDto getMemberBymId(String mId) {
		SqlSession sqlSession = factory.openSession();
		MemberDto dto = sqlSession.selectOne("select_by_mId", mId);
		sqlSession.close();
		return dto;
	}
	public int getInsertJoin(MemberDto mDto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("insert_join",mDto);
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

	public int getUpdateMember(MemberDto mDto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_member",mDto);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}	
}