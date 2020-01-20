package com.koreait.mvc17.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.korea.mvc17.dao.BoardDao;

public class BoardListCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		model.addAttribute("list", bDao.list()); // 전체 게시물 전달
		model.addAttribute("result", bDao.list().size()); // 전체 게시물 개수 전달
	}

}
