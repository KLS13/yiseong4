package com.koreait.mvc11.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.koreait.mvc11.dao.BoardDao;
import com.koreait.mvc11.dto.BoardDto;

public class BoardModifyCommand implements BoardCommand {

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

		BoardDto bDto = new BoardDto(); // 모든 new 를 없애려고 노력하지는 맙시다.
		bDto.setbIdx( Integer.parseInt(request.getParameter("bIdx")) );
		bDto.setbTitle( request.getParameter("bTitle") );
		bDto.setbContent( request.getParameter("bContent") );
		
		// BoardDao bDao = new BoardDao();
		bDao.modify(bDto);		
		
		// 수정 완료 후 view.jsp 로 이동하기 위해 bIdx 를 전달해야 한다.
		model.addAttribute("bIdx", bDto.getbIdx());
		
	}

}
