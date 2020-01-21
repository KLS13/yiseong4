package com.koreait.mvc18.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mvc18.dao.BoardDao;

public class BoardQueryCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String query = request.getParameter("query");

		/*  mysql 방식
		String content = request.getParameter("content");
		model.addAttribute("list",bDao.dynamicQueryList(query, content));
		model.addAttribute("listCount", bDao.dynamicQueryList(query, content).size());
		*/
		
		/* 표준 sql 방식 */
		String content = "%" + request.getParameter("content") + "%";
		model.addAttribute("list",bDao.dynamicQueryList(query, content));
		model.addAttribute("listCount", bDao.dynamicQueryList(query, content).size());
	}

}
