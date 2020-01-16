package com.koreait.mvc12.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.ui.Model;

import com.koreait.mvc12.config.AnnoConfig;
import com.koreait.mvc12.dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	// Field
	
	// Method
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String strbIdx = request.getParameter("bIdx");
		
		// BoardDao bDao = new BoardDao();
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
		BoardDao bDao = ctx.getBean("bDao", BoardDao.class);
		bDao.delete(strbIdx);
		
	}

}