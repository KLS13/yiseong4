package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.ItemDto;

public class GoBuyPage implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		MemberDao dao = MemberDao.getInstance();
		List<ItemDto> list = dao.getItemList();
	
		request.setAttribute("list", list);
		
		return "buy/buyPage.jsp";
	}

}
