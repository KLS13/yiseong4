package com.koreait.mvc13.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.koreait.mvc13.dao.BoardDao;
import com.koreait.mvc13.dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	@Override
	public void execute(Model model) {
		
		//model 에서 request 얻어내기
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String strbIdx = request.getParameter("bIdx");
		
		BoardDao bDao = new BoardDao();
		BoardDto bDto = bDao.view(strbIdx);
		
		model.addAttribute("bDto", bDto); // jsp 에 전달되는 데이터
		
	}

}
