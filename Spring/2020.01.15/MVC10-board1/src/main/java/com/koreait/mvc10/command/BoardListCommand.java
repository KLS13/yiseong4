package com.koreait.mvc10.command;

import java.util.ArrayList;

import org.springframework.ui.Model;
import com.koreait.mvc10.dao.BoardDao;
import com.koreait.mvc10.dto.BoardDto;

public class BoardListCommand implements BoardCommand {

	@Override
	public void execute(Model model) {
		
		BoardDao bDao = new BoardDao();
		ArrayList<BoardDto> list = bDao.list();
		model.addAttribute("list", list);
		
	}

}
