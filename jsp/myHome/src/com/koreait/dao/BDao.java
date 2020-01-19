package com.koreait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.Bdto;
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
	public List<Bdto> getBoardList(Map<String, Integer> map) {
		SqlSession sqlSession = factory.openSession();
		List<Bdto> list = sqlSession.selectList("select_board_by_map", map);
		sqlSession.close();
		return list;
	}
	
	public int getTotalRecord() {
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.selectOne("select_total_record");
		sqlSession.close();
		return result;
	}
	
	public int getInsertBoard(Bdto bDto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.insert("insert_board", bDto);
		if(result>0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
	public Bdto getBoardBybIdx(int bIdx) {
		SqlSession sqlSession = factory.openSession();
		Bdto bDto = sqlSession.selectOne("select_board_by_bIdx",bIdx);
		sqlSession.close();
		return bDto;
	}
	
	public int getDeleteBoard(Bdto bDto) {
		SqlSession sqlSession = factory.openSession(false);
		int result = sqlSession.update("update_board_for_delete", bDto);
		if(result>0) {
			sqlSession.commit();
		}
		sqlSession.close();
		return result;
	}
	
}