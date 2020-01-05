package com.koreait.dao;

import org.apache.ibatis.session.SqlSessionFactory;

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
	
}