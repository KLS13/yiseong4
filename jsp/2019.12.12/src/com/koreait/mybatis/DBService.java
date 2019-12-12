package com.koreait.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService {

	private static SqlSessionFactory factory;
	
	//static 초기화
	static {
		try {
			String resource = "com/koreait/mybatis/sqlmap.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		}catch(Exception e) {
			
		}
	}
	//factory 를 리턴하는 getFactory() 메소드
	public static SqlSessionFactory getFactory() {
		return factory;
	}
}
