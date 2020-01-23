package com.koreait.mvc20.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.mvc20.dao.ImageDao;

public class ImageListCommand implements ImageCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		ImageDao iDao = sqlSession.getMapper(ImageDao.class);
		model.addAttribute("list", iDao.imageList());

	}

}
