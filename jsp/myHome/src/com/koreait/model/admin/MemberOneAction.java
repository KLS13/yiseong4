package com.koreait.model.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.dao.ADao;
import com.koreait.dto.Mdto;

public class MemberOneAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mId = request.getParameter("mId");
		
		ADao adao = ADao.getInstance();
		
		Mdto mdto = adao.getOneMember(mId);
		
		request.setAttribute("mdto", mdto);
		
		ActionForwad forward = new ActionForwad();
		forward.setPath("/admin/memberPage2.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}