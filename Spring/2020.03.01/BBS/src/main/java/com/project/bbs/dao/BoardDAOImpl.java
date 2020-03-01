package com.project.bbs.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.project.bbs.domain.BoardVo;

	
@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	 private SqlSession sql;
	 
	 private static String namespace = "com.project.bbs.dao.mapper.board";

	@Override
	public List<BoardVo> list() throws Exception {	
		
		return sql.selectList(namespace + ".list");
	}

}
