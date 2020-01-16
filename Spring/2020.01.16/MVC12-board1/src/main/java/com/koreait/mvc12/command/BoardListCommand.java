package com.koreait.mvc12.command;

import java.util.ArrayList;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.ui.Model;

import com.koreait.mvc12.config.AnnoConfig;
import com.koreait.mvc12.dao.BoardDao;
import com.koreait.mvc12.dto.BoardDto;

public class BoardListCommand implements BoardCommand {

	// Field
	
	// Method

	@Override
	public void execute(Model model) {
		
		// DI 없이 직접 new를 사용한 방식
		// BoardDao bDao = new BoardDao();
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
		BoardDao bDao = ctx.getBean("bDao", BoardDao.class);
		
		ArrayList<BoardDto> list = bDao.list(); // DB에서 목록 가져오기
		model.addAttribute("list", list); // 이동할 list.jsp로 전달할 list
		
	}

}
