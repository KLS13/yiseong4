package com.koreait.mvc20.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public interface ImageCommand {

	public void execute(SqlSession sqlSession, Model model);
	
}
