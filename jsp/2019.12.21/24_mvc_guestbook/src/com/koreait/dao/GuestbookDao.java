package com.koreait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.GuestbookDto;
import com.koreait.mybatis.config.DBService;

public class GuestbookDao {
	
	// Field
	private SqlSessionFactory factory = null;
	
	// Singleton
	private GuestbookDao() {
		factory = DBService.getFactory();
	}
	private static GuestbookDao dao = new GuestbookDao();
	public static GuestbookDao getInstance() {
		return dao;
	}
	
	// Method
	// GuestbookDao 는 필드로 factory 를 가지고 있으므로,
	// 모든 메소드들은 factory 를 그냥 사용할 수 있습니다.
	// 검색, 삽입, 수정, 삭제 등의 메소드를 아래에 추가합니다.

	// 1. 전체 검색
	public List<GuestbookDto> getList() {
		SqlSession sqlSession = factory.openSession();
		List<GuestbookDto> list = sqlSession.selectList("select_all");
		sqlSession.close();
		return list;
	}
	
	// 2. 방명록 삽입
	public int getInsert(GuestbookDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert", dto);
		if (result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	// 3. 방명록 검색
	public GuestbookDto getGuestbook(int idx) {
		SqlSession sqlSession = factory.openSession();
		GuestbookDto dto = sqlSession.selectOne("select_by_idx", idx);
		sqlSession.close();
		return dto;
	}
	
	// 4. 방명록 삭제
	public int getDelete(int idx) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.delete("delete", idx);
		if (result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	// 5. 방명록 수정
	public int getUpdate(GuestbookDto dto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update", dto);
		if (result > 0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
}