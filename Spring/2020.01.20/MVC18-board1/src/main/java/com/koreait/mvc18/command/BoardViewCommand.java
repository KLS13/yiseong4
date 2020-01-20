package com.koreait.mvc18.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mvc18.dao.BoardDao;

public class BoardViewCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		model.addAttribute("bDto", bDao.view(Integer.parseInt(request.getParameter("bIdx"))));
		// 리다이렉트일 경우 addAttribute 해도  리다이렉트 할때 사라짐.
	}

}
