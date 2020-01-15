package com.koreait.model.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.dao.MDao;
import com.koreait.dto.Mdto;

public class LoginAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		Mdto mdto = new Mdto();
		mdto.setmId(mId);
		mdto.setmPw(mPw);
		
		MDao dao = MDao.getInstance();
		int result = dao.getUpdatePoint(mId);
		request.setAttribute("result", result);
		
		Mdto loginDto = dao.getMemberLogin(mdto);
		
		
		ActionForwad forward = new ActionForwad();
		
		HttpSession session = null;
		
		if(loginDto != null) {
			session = request.getSession();
			session.setAttribute("loginDto", loginDto);
			forward.setPath("index.jsp");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('일치하는 회원 정보가 없습니다. 다시 시도하세요.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
	
		return forward;
		
	}

}