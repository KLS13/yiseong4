package com.koreait.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.koreait.dao.MemberDao;
import com.koreait.dto.MemberDto;

public class BuyAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		String item = request.getParameter("item");
		String mId = request.getParameter("mId");
		int mPoint = Integer.parseInt(request.getParameter("price"));
		
		HttpSession session = request.getSession();
	
		MemberDto mDto = new MemberDto();
		
		mDto.setmPoint(mPoint);
		mDto.setmId(mId);
		
		MemberDao dao = MemberDao.getInstance();
		dao.getUpdatePointMinus(mDto);
		int result = dao.getUpdateItem(item);
		
		request.setAttribute("result", result);
		request.setAttribute("mDto", mDto);
		request.setAttribute("item", item);
		
		return "buy/buyResult.jsp";
	}

}
