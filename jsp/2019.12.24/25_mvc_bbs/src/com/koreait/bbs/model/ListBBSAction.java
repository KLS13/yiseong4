package com.koreait.bbs.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.koreait.dao.BDao;
import com.koreait.dto.BDto;
import com.koreait.dto.Paging;

public class ListBBSAction implements Action {

	@Override
	public String command(HttpServletRequest request, HttpServletResponse response) {

		
		/***** 1. begin, end 계산하기 *****/
		
		// 1) Paging 객체 생성
		Paging pvo = new Paging();
		
		// 2) 전체 게시글의 개수 구하기
		BDao bdao = BDao.getInstance();
		pvo.setTotalRecord( bdao.getTotalRecordCount() );
		
		// 3) 전체 페이지 개수 구하기
		pvo.setTotalPage();
		
		// 4) 현재 페이지 번호 구하기
		// Paging 클래스의 "nowPage = 1"로 설정되어 있으므로
		// currentPage 파라미터가 없으면 1 페이지로 이동한다.
		String currentPage = request.getParameter("currentPage");
		if ( currentPage != null && !currentPage.isEmpty() ) {
			pvo.setNowPage( Integer.parseInt(currentPage) );
		}
		
		// 5) 현재 페이지 번호에 따른 begin, end 구하기
		pvo.setBegin( (pvo.getNowPage() - 1) * pvo.getRecordPerPage() + 1 );
		pvo.setEnd( pvo.getBegin() + pvo.getRecordPerPage() - 1 );

		
		
		/***** 2. begin, end 사이의 게시글을 DB에서 가져오기 *****/
		
		// 1) begin, end 변수 저장
		int begin = pvo.getBegin();
		int end = pvo.getEnd();
		
		// 2) begin, end를 저장하는 Map 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		
		// 3) begin, end 사이의 게시글 목록 DB 에서 가져오기
		List<BDto> list = bdao.getBBSList(map);
		
		// 4) "bbs/bbsList.jsp" 에서 사용할 수 있도록 list 를 request 에 저장
		request.setAttribute("list", list);
		
		
		
		/***** 3. 페이징 처리를 위한 block 계산 *****/
		
		// 1) beginPageOfBlock, endPageOfBlock 계산하기
		pvo.setBeginPageOfBlock( ((pvo.getNowPage() - 1) / pvo.getPagePerBlock()) * pvo.getPagePerBlock() + 1 );
		pvo.setEndPageOfBlock( pvo.getBeginPageOfBlock() + pvo.getPagePerBlock() - 1 );
		
		// 2) endPageOfBlock 조정하기
		if ( pvo.getEndPageOfBlock() > pvo.getTotalPage() ) {
			pvo.setEndPageOfBlock(pvo.getTotalPage());
		}
		
		// 3) "bbs/bbsList.jsp" 에서 사용할 수 있도록 pvo 를 request 에 저장
		request.setAttribute("pvo", pvo);
		
		
		
		/***** 4. Hit 처리를 위한 session 처리 *****/
		
		// 게시글이 일단 열리면 session 에 OPEN 속성이 "YES" 값이 저장되는데
		// 게시글을 닫으면(목록보기상태는 게시글을 닫았다는 의미) session 에 저장한 OPEN 속성을 제거해야 한다.
		HttpSession session = request.getSession();
		String OPEN = (String)session.getAttribute("OPEN");
		if ( OPEN != null ) {
			session.removeAttribute("OPEN");
		}
		
		return "bbs/bbsList.jsp";
		
	}

}