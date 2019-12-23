package com.koreait.bbs.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.BDao;
import com.koreait.dto.BDto;

public class ViewBBSAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		
		int b_idx =  Integer.parseInt(request.getParameter("b_idx"));
		
		BDao bdao = BDao.getInstance();
		BDto bdto = bdao.getBBS(b_idx);
				
		// 상세보기는 세션에 올림.  수정,삭제 편하게 활용
		
		HttpSession session = request.getSession();
		session.setAttribute("bdto", bdto);
		return "bbs/view.jsp";
	}

}
