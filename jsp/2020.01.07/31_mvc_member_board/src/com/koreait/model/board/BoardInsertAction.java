package com.koreait.model.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.dao.BDao;
import com.koreait.dto.BoardDto;

public class BoardInsertAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String bTitle = request.getParameter("bTitle");
		String mId = request.getParameter("mId");
		String bContent = request.getParameter("bContent");
		String bPw = request.getParameter("bPw");
		String bIp = request.getRemoteAddr();
		
		BoardDto bDto = new BoardDto();
		bDto.setbTitle(bTitle);
		bDto.setmId(mId);
		bDto.setbContent(bContent);
		bDto.setbPw(bPw);
		bDto.setbIp(bIp);
		
		BDao bdao = BDao.getInstance();
		
		int result = bdao.getInsertBoard(bDto);
		ActionForwad forward = new ActionForwad();
		if(result>0) {
			forward.setPath("/31_mvc_member_board/boardList.bo");
			forward.setRedirect(true);
		}else {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('게시글 등록 실패')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return forward;
	}

}
