package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.dao.BDao;

public class RemoveBBSAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		
		BDao bdao = BDao.getInstance();
		int result = bdao.getRemove(b_idx);
		
		request.setAttribute("result", result);
		
		return "bbs/remove_result.jsp";
		
	}

}
