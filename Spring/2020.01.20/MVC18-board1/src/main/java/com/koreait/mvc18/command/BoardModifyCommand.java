package com.koreait.mvc18.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mvc18.dao.BoardDao;

public class BoardModifyCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String bName = request.getParameter("bName");
		String bTel = request.getParameter("bTel");
		String bAddr = request.getParameter("bAddr");
		String bEmail = request.getParameter("bEmail");
		String bNote = request.getParameter("bNote");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		bDao.modify(bName, bTel, bAddr, bEmail, bNote, bIdx);
	}

}
