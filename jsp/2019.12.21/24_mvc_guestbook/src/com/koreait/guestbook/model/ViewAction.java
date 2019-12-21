package com.koreait.guestbook.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.GuestbookDao;
import com.koreait.dto.GuestbookDto;

public class ViewAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		GuestbookDao dao = GuestbookDao.getInstance();
		GuestbookDto dto = dao.getGuestbook(idx);
		
		// 수정, 삭제에서 열람된 dto 를 활용하기 위해 session 에 올림
		HttpSession session = request.getSession();
		session.setAttribute("dto", dto);
		
		return "guestbook/view.jsp";
		
	}

}