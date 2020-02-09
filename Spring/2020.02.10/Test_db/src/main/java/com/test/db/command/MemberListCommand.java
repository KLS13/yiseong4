package com.test.db.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.test.db.dao.MemberDao;

public class MemberListCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		MemberDao mdao = sqlSession.getMapper(MemberDao.class);
		model.addAttribute("list",mdao.memberList());

	}

}
