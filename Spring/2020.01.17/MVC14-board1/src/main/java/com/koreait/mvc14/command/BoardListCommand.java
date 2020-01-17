package com.koreait.mvc14.command;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.mvc14.dao.BoardDao;
import com.koreait.mvc14.dto.BoardDto;

public class BoardListCommand implements BoardCommand {

	// Field
	private BoardDao bDao = null;
	
	// Method
	@Autowired
	public void xxx(BoardDao bDao) {
		this.bDao = bDao;
	}
	
	@Override
	public void execute(Model model) {
		
		// BoardDao bDao = new BoardDao();
		ArrayList<BoardDto> list = bDao.list();
		model.addAttribute("list", list);

	}

}
