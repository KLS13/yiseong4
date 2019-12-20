package com.koreait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.koreait.dto.EmployeeDto;
import com.koreait.mybatis.config.DBService;

public class EmployeeDao {

	private static SqlSession sqlSession = null;
	private synchronized static SqlSession getSqlSession() {
		if ( sqlSession == null ) {
			sqlSession = DBService.getFactory().openSession();
		}
		return sqlSession;
	}
	
	// 1. 전체검색
	public static List<EmployeeDto> getAllEmployees() {
		List<EmployeeDto> list = getSqlSession().selectList("select_all");
		return list;
	}
	
	
	// 2. 부서검색
	public static List<EmployeeDto> getEmployeeByDept(int department_id) {
		List<EmployeeDto> list = getSqlSession().selectList("select_by_dept", department_id);
		return list;
	}
	
	
	// 3. 동적검색
	public static List<EmployeeDto> getEmployeeByDynamic(Map<String, String> map) {
		List<EmployeeDto> list = getSqlSession().selectList("select_by_dynamic", map);
		return list;
	}
	
	
}










