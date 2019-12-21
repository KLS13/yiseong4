package com.koreait.guestbook.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.GuestbookDao;
import com.koreait.dto.GuestbookDto;

public class ListAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		GuestbookDao dao = GuestbookDao.getInstance();
		List<GuestbookDto> list = dao.getList();
		
		request.setAttribute("list", list);
		
		return "guestbook/list.jsp";
		
	}

}