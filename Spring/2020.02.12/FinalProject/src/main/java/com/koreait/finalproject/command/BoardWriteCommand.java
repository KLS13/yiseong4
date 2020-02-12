package com.koreait.finalproject.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.finalproject.dao.BoardDao;

public class BoardWriteCommand implements BoardCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		BoardDao bDao = sqlSession.getMapper(BoardDao.class);
		
		Map<String, Object> map = model.asMap();
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String bWriter = request.getParameter("bWriter");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		RedirectAttributes redirectAttributes = (RedirectAttributes) map.get("redirectAttributes");
		redirectAttributes.addFlashAttribute("writeResult", bDao.write(bWriter, bTitle, bContent));
		redirectAttributes.addFlashAttribute("isWrite", "yes");
		
	}
	
}
