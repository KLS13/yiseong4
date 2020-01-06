package com.koreait.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.MemberDao;
import com.koreait.dto.ItemDto;
import com.koreait.dto.MemberDto;

public class BuyAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
		String item = request.getParameter("item");
		String mId = request.getParameter("mId");
		int mPoint = Integer.parseInt(request.getParameter("price"));
		
		HttpSession session = request.getSession();
		session.getMaxInactiveInterval();
		MemberDto mDto = new MemberDto();
		
		mDto.setmPoint(mPoint);
		mDto.setmId(mId);
		
		MemberDao dao = MemberDao.getInstance();
		dao.getUpdatePointMinus(mDto);
		int result = dao.getUpdateItem(item);
		MemberDto loginDto = dao.getMemberPointReset(mId);
		
		request.setAttribute("result", result);
		request.setAttribute("mDto", mDto);
		request.setAttribute("item", item);
		session.setAttribute("loginDto", loginDto);
		
		return "buy/buyResult.jsp";
	}
}
