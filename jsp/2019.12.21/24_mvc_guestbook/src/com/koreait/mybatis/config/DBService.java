package com.koreait.mybatis.config;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {

	// Field
	private static SqlSessionFactory factory;
	
	// static 초기화 (factory 를 만들어 주는 부분)
	static {
		try {
			String resource = "com/koreait/mybatis/config/sqlmap_config.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	// factory 를 리턴하는 getFactory() 메소드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
	
}