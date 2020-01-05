package com.koreait.model.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.dao.MDao;
import com.koreait.dto.MemberDto;

public class MemberListAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ActionForwad forward = new ActionForwad();
		
		MDao dao = MDao.getInstance();
		List<MemberDto> list = dao.getMemberList();
		
		request.setAttribute("list", list);
		
		forward.setPath("admin/memberPage.jsp");
		forward.setRedirect(true);
		
		return forward;
	}

}
