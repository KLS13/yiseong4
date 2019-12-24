package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.BDao;

public class RemoveCommentAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		int c_idx = Integer.parseInt(request.getParameter("c_idx"));
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String currentPage = request.getParameter("currentPage");
		
		BDao bdao = BDao.getInstance();
		int result = bdao.getRemoveComment(c_idx);
		
		request.setAttribute("result", result);
		request.setAttribute("b_idx", b_idx);
		request.setAttribute("currentPage", currentPage);
		
		return "bbs/remove_comment_result.jsp";
		
	}

}






