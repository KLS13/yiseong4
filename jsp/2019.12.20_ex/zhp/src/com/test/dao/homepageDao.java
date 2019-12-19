package com.test.dao;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.test.dto.homepageDto;
import com.test.mybatis.config.DBService;

public class homepageDao {

	// factory 선언
	private SqlSessionFactory factory = null;
	
	// singleton
	private static homepageDao dao = null;
	private homepageDao() {
		// factory 생성
		factory = DBService.getInstance().getFactory();
	}
	public static homepageDao getInstance() {
		if ( dao == null ) {
			dao = new homepageDao();	// 생성자 호출(factory 생성)
		}
		return dao;
	}
	
	
	//로그인
	public List<homepageDto> getLogin(homepageDto dto) {
		SqlSession sqlSession = factory.openSession();
		List<homepageDto> list = sqlSession.selectList("select_login", dto);
		sqlSession.close();
		return list;
	}
	
	//회원가입
	public int getJoin(homepageDto dto) {
		SqlSession sqlSession = factory.openSession();
		int result = sqlSession.insert("insert_join", dto);
		sqlSession.close();
		return result;
	}
}