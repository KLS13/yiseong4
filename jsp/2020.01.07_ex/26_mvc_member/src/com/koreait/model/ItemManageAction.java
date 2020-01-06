package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.MemberDao;
import com.koreait.dto.ItemDto;
import com.koreait.dto.MemberDto;

public class ItemManageAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		String item = request.getParameter("item");
		int ea = Integer.parseInt(request.getParameter("ea"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		
		ItemDto dto = new ItemDto();
		dto.setItem(item);
		dto.setPrice(price);
		dto.setEa(ea);
		
		MemberDao dao = MemberDao.getInstance();
		int result = dao.getInsertItem(dto);
		
		request.setAttribute("success", result);
		
		return "index.jsp";
	}

}
