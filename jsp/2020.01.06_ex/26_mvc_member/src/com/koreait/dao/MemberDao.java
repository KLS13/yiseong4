package com.koreait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.ItemDto;
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
	
	public MemberDto getMemberForLogin(MemberDto dto) {
		SqlSession sqlSession = factory.openSession();
		MemberDto mDto = sqlSession.selectOne("select_by_mId_mPw", dto);
		sqlSession.close();
		return mDto;
	}
	
	public List<ItemDto> getItemList() {
		SqlSession sqlSession = factory.openSession();
		List<ItemDto> list = sqlSession.selectList("select_list");
		sqlSession.close();
		return list;
	}
	
	public MemberDto getMemberPointReset(String mId) {
		SqlSession sqlSession = factory.openSession();
		MemberDto mDto = sqlSession.selectOne("select_by_Point_Reset", mId);
		sqlSession.close();
		return mDto;
	}
	
	
	public int getMemberUpdatePoint(String mId) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("updatePoint", mId);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	public MemberDto getMemberBymEmail(String mEmail) {
		SqlSession sqlSession = factory.openSession();
		MemberDto mDto = sqlSession.selectOne("select_by_mEmail", mEmail);
		sqlSession.close();
		return mDto;
	}
	
	public MemberDto getMemberBymId(String mId) {
		SqlSession sqlSession = factory.openSession();
		MemberDto mDto = sqlSession.selectOne("select_by_mId", mId);
		sqlSession.close();
		return mDto;
	}
	
	public int getUpdatemPw(MemberDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_mPw", dto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getInsertMember(MemberDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert", dto);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	public int getDeleteMember(String mId) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("leave", mId);
		if ( result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public int getUpdateItem(String item) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_item", item);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
		}
	
	public int getUpdatePointMinus(MemberDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("point_minus", dto);
		if(result > 0 ) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
		}
	public ItemDto getItem(String item) {
		SqlSession sqlSession = factory.openSession();
		ItemDto mDto = sqlSession.selectOne("select_item", item);
		sqlSession.close();
		return mDto;
	}	
}

