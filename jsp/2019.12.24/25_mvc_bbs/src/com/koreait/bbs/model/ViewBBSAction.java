package com.koreait.bbs.model;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.BDao;
import com.koreait.dto.BDto;
import com.koreait.dto.CDto;

public class ViewBBSAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {
	
		
		int b_idx = Integer.parseInt(request.getParameter("b_idx"));
		String currentPage = request.getParameter("currentPage");

		HttpSession session = request.getSession();
		
		BDao bdao = BDao.getInstance();
		
		// 게시글 가져오기
		BDto bdto = bdao.getBBS(b_idx);
		// 열어 놓은 게시글 bdto 는 session 에 올려서 수정, 삭제시 활용한다.
		session.setAttribute("bdto", bdto);
		
		// 댓글 목록 가져오기
		List<CDto> cList = bdao.getCommentList(b_idx);
		// 댓글 목록 request 에 저장하기
		request.setAttribute("cList", cList);
		
		// 히트수 증가
		// 처음으로 열었을때만 조회수가 증가되도록
		// 게시글을 처음 열 때 session 에 open 이라는 값을 저장한다.
		// session 에 open 값이 있으면 조회수를 증가시키지 않는다.
		// session 에 open 값이 없으면 조회수를 증가시킨다.
		String open = (String)session.getAttribute("open");
		if ( open == null ) { // open 이 null 이면 해당 게시물을 처음 열었다는 의미이다.
			session.setAttribute("open", "YES");
			// 1) 기존 히트수 가져오기
			int hit = bdto.getHit();
			// 2) +1
			bdto.setHit(hit + 1);
			// 3) DB에 반영하기
			bdao.getUpdateHit(bdto);
		}
		
		
		// 현재 페이지 번호 넘기기
		request.setAttribute("currentPage", currentPage);
		
		return "bbs/view.jsp";
		
	}

}