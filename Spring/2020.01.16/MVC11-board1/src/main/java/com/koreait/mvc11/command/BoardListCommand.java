package com.koreait.mvc11.command;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.mvc11.dao.BoardDao;
import com.koreait.mvc11.dto.BoardDto;

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
		
		// DI 없이 직접 new를 사용한 방식
		// BoardDao bDao = new BoardDao();
		
		ArrayList<BoardDto> list = bDao.list(); // DB에서 목록 가져오기
		model.addAttribute("list", list); // 이동할 list.jsp로 전달할 list
		
	}

}
