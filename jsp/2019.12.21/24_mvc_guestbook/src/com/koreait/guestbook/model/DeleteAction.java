package com.koreait.guestbook.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.GuestbookDao;

public class DeleteAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		int idx = Integer.parseInt( request.getParameter("idx") );
		
		GuestbookDao dao = GuestbookDao.getInstance();
		int result = dao.getDelete(idx);
		
		// 성공, 실패에 따라 다른 path 사용
		String path = null;
		if ( result > 0 ) {
			path = "/list.do"; // 삭제 성공 -> 전체 보기
		} else {
			path = "/view.do?idx=" + idx; // 삭제 실패 -> 방명록 보기
		}
		return path;
		
	}

}
