package com.koreait.model.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.dao.BDao;
import com.koreait.dto.BoardDto;

public class BoardViewAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		int bIdx = Integer.parseInt(request.getParameter("bIdx"));
		String currentPage = request.getParameter("currentPage");
		request.setAttribute("currentPage", currentPage);
		
		BDao bDao = BDao.getInstance();
		
		BoardDto bDto = bDao.getBoardBybIdx(bIdx);
		request.setAttribute("bDto", bDto);
		
		ActionForwad forward = new ActionForwad();
		
		if(bDto != null) {
			forward.setPath("/board/boardViewPage.jsp");
			forward.setRedirect(false);
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('게시글 불러오기 실패')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}

}
