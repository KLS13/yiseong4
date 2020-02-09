package com.test.db.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.test.db.dao.MemberDao;

public class MemberViewCommand implements MemberCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		MemberDao dao = sqlSession.getMapper(MemberDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		int mIdx = Integer.parseInt(request.getParameter("mIdx"));
		
		model.addAttribute("dto", dao.view(mIdx));
	}

}
