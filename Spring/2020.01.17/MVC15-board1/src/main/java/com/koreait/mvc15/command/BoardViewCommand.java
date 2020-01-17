package com.koreait.mvc15.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.ui.Model;

import com.koreait.mvc15.config.AnnoConfig;
import com.koreait.mvc15.dao.BoardDao;
import com.koreait.mvc15.dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	// Field
	
	// Method
	
	@Override
	public void execute(Model model) {
		
		// model 에 저장되어 있는 request 를 추출한다.
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		String strbIdx = request.getParameter("bIdx");
		
		// BoardDao bDao = new BoardDao(); DI(@Autowired)로 처리되므로 필요 없다.
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(AnnoConfig.class);
		BoardDao bDao = ctx.getBean("bDao", BoardDao.class);
		BoardDto bDto = bDao.view(strbIdx);
		
		// bDto 를 view.jsp 에서 사용할 수 있도록 model 에 저장한다.
		model.addAttribute("bDto", bDto);
		
	}

}
