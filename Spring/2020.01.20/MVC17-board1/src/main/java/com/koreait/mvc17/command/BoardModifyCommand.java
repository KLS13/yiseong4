package com.koreait.mvc17.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.korea.mvc17.dao.BoardDao;

public class BoardModifyCommand implements BoardCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		
		RedirectAttributes redirectAttributes = (RedirectAttributes) map.get("redirectAttributes");
		
		// RedirectAttributes 에 속성 저장은 addFlashAttribute() 메소드로 한다.
		// redirect:list 이동하므로
		// list.jsp 에서 ${modifyResult}, ${isModify} 값을 확인할 수 있다.
		redirectAttributes.addFlashAttribute("modifyResult", bDao.modify(bTitle, bContent, bIdx));
		redirectAttributes.addFlashAttribute("isModify", "yes");
		
	}

}
