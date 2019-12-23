package com.koreait.bbs.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.BDao;
import com.koreait.dto.BDto;

public class ListBBSAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		BDao bdao = BDao.getInstance();
		List<BDto> list = bdao.getBBSList(); // map 전달
		
		request.setAttribute("list", list);
		
		return "bbs/bbsList.jsp";
	}

}
