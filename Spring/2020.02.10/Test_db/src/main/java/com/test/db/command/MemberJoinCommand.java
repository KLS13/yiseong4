package com.test.db.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.test.db.dao.MemberDao;

public class MemberJoinCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");

		String mName = request.getParameter("mName");
		String mPhone = request.getParameter("mPhone");
		String mAddr = request.getParameter("mAddr");
		String mJob = request.getParameter("mJob");
		
		dao.memberJoin(mName, mPhone, mAddr, mJob);

	}

}
