package com.koreait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import com.koreait.dto.EmpDto;
import com.koreait.mybatis.config.DBService;

public class EmpDao {

	private SqlSessionFactory factory = null;
	
	private static EmpDao dao = null;
	public EmpDao() {
		factory = DBService.getInstance().getFactory();
	}
	public static EmpDao getInstance() {
		if(dao==null) {
			dao = new EmpDao();
		}
		return dao;
	}
	
	public List<EmpDto> getEmpByDept(String empDept) {
		SqlSession sqlSession = factory.openSession();
		List<EmpDto> list = sqlSession.selectList("select_Emp_by_dept", empDept);
		sqlSession.close();
		return list;
	}
	
	public List<EmpDto> getAllEmp() {
		SqlSession sqlSession = factory.openSession();
		List<EmpDto> list = sqlSession.selectList("select_all_emp");
		sqlSession.close();
		return list;
	}
}
