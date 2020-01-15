package com.koreait.mvc10.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.mvc10.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String strbIdx = request.getParameter("bIdx");
		
		BoardDao bDao = new BoardDao();
		bDao.delete(strbIdx);

	}
}
