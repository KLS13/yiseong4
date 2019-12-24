package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.BDao;
import com.koreait.dto.CDto;

public class InsertCommentAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		CDto cdto = new CDto();
		cdto.setWriter( request.getParameter("writer") );
		cdto.setContent( request.getParameter("content") );
		cdto.setPw( request.getParameter("pw") );
		cdto.setIp( request.getRemoteAddr() );
		cdto.setB_idx( Integer.parseInt(request.getParameter("b_idx")) );
		
		BDao bdao = BDao.getInstance();
		int result = bdao.getInsertComment(cdto);
		
		request.setAttribute("result", result);
		request.setAttribute("b_idx", request.getParameter("b_idx"));
		
		return "bbs/insert_comment_result.jsp";
		
	}

}







