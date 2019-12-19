package com.koreait.mybatis.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {
	
	// DBService 목적
	// SqlSessionFactory 를 리턴하기 위함이다.

	// 리턴할 factory 선언
	private SqlSessionFactory factory = null;
	
	// singleton DBService (factory 를 하나만 생성)
	private static DBService singleton = null;
	private DBService() {
		// factory 생성
		try {
			String resource = "com/koreait/mybatis/config/sqlmap.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	public static DBService getInstance() {
		if ( singleton == null ) {
			singleton = new DBService();
		}
		return singleton;
	}
	
	// 생성된 factory 리턴	
	public SqlSessionFactory getFactory() {
		return factory;
	}
	
}