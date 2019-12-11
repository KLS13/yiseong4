package com.mybatis;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBService2 {
	private SqlSessionFactory factory = null;
	
	// singleton
	private static DBService2 service = null;
	public DBService2() {
		try {
			String resource = "com/mybatis/sqlmap.xml";
			InputStream is = Resources.getResourceAsStream(resource);
			factory = new SqlSessionFactoryBuilder().build(is);
		} catch ( Exception e) {
			
		}
	}
		public static DBService2 getInstance() {
			if(service == null) {
				service = new DBService2();
			}
			return service;
		}
		public SqlSessionFactory getFactory() {
			return factory;
		}
	}
