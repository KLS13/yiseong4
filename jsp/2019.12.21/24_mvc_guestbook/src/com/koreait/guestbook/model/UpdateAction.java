package com.koreait.guestbook.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.GuestbookDao;
import com.koreait.dto.GuestbookDto;

public class UpdateAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		GuestbookDto dto = new GuestbookDto();
		dto.setIdx( Integer.parseInt(request.getParameter("idx")) );
		dto.setWriter( request.getParameter("writer") );
		dto.setTitle( request.getParameter("title") );
		dto.setEmail( request.getParameter("email") );
		dto.setContent( request.getParameter("content") );
		
		GuestbookDao dao = GuestbookDao.getInstance();
		int result = dao.getUpdate(dto);
		
		// 성공, 실패에 따라 다른 path 사용
		String path = null;
		if ( result > 0 ) {
			path = "/view.do?idx=" + dto.getIdx(); // 수정 성공 -> 방명록 보기로 수정된 내용 확인
		} else {
			path = "/pageForUpdate.do"; // 수정 실패 -> 다시 수정 페이지로 이동
		}
		return path;
	}

}