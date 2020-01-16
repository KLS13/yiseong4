package com.koreait.model.admin;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.dao.ADao;
import com.koreait.dto.Mdto;

public class MemberListAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		// MDao 생성
		ADao aDao = ADao.getInstance();
		
		// MDao 의 getMemberBymIdmPw() 메소드 호출
		List<Mdto> list = aDao.getAllMember();
		
		request.setAttribute("list", list);
		
		ActionForwad forward = new ActionForwad();
		forward.setPath("/admin/memberPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
