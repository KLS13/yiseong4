package com.koreait.mvc11.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.mvc11.dao.BoardDao;
import com.koreait.mvc11.dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	// Field
	private BoardDao bDao = null;
	
	// Method
	
	@Autowired
	public void xxx(BoardDao bDao) {
		this.bDao = bDao;
	}
	
	@Override
	public void execute(Model model) {
		
		// model 에 저장되어 있는 request 를 추출한다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String strbIdx = request.getParameter("bIdx");
		
		// BoardDao bDao = new BoardDao(); DI(@Autowired)로 처리되므로 필요 없다.
		BoardDto bDto = bDao.view(strbIdx);
		
		// bDto 를 view.jsp 에서 사용할 수 있도록 model 에 저장한다.
		model.addAttribute("bDto", bDto);
		
	}

}
