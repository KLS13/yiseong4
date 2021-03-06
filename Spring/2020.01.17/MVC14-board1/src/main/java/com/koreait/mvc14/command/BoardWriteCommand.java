package com.koreait.mvc14.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.mvc14.dao.BoardDao;

public class BoardWriteCommand implements BoardCommand {

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
		
		String bWriter = request.getParameter("bWriter");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		// BoardDao bDao = new BoardDao();
		bDao.write(bWriter, bTitle, bContent);
		
	}

}