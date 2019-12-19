package com.koreait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.dto.ClientDto;
import com.koreait.mybatis.config.DBService;

public class ClientDao {

	// factory 선언
	private SqlSessionFactory factory = null;
	
	// singleton
	private static ClientDao dao = null;
	private ClientDao() {
		// factory 생성
		factory = DBService.getInstance().getFactory();
	}
	public static ClientDao getInstance() {
		if ( dao == null ) {
			dao = new ClientDao();	// 생성자 호출(factory 생성)
		}
		return dao;
	}
	
	
	// 전체검색
	public List<ClientDto> getAllClient() {
		SqlSession sqlSession = factory.openSession();
		List<ClientDto> list = sqlSession.selectList("select_all_client");
		sqlSession.close();
		return list;
	}
	
	// 지역별검색
	public List<ClientDto> getClientByRegion(String region) {
		SqlSession sqlSession = factory.openSession();
		List<ClientDto> list = sqlSession.selectList("select_client_by_region", region);
		sqlSession.close();
		return list;
	}
	//사람 검색
	public List<ClientDto> getClientByName(String name) {
		SqlSession sqlSession = factory.openSession();
		List<ClientDto> list = sqlSession.selectList("select_client_by_name", name);
		sqlSession.close();
		return list;
	}
	
}