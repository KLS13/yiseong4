package com.koreait.mvc11.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.mvc11.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	// Field
	private BoardDao bDao = null;
	
	// Method
	@Autowired
	public void xxx(BoardDao bDao) {
		this.bDao = bDao;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String strbIdx = request.getParameter("bIdx");
		
		// BoardDao bDao = new BoardDao();
		bDao.delete(strbIdx);
		
	}

}






