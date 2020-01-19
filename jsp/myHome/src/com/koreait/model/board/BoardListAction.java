package com.koreait.model.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.common.Action;
import com.koreait.common.ActionForwad;
import com.koreait.common.Paging;
import com.koreait.dao.BDao;
import com.koreait.dto.Bdto;

public class BoardListAction implements Action {

	@Override
	public ActionForwad execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 현재 페이지 번호 구하기 (파라미터로 전달)
		String currentPage = request.getParameter("currentPage");
		int nowPage = 1; // 기본 페이지 번호는 1로 정함
		if (currentPage != null && !currentPage.isEmpty()) {
			nowPage = Integer.parseInt(currentPage);
		}

		// 현재 페이지 번호를 request 에 저장
		request.setAttribute("currentPage", nowPage);

		// 현재 페이지 번호를 알면
		// 현재 페이지에 표시되는 게시글을 시작 번호와 끝 번호를 알 수 있다.
		// 추가로 페이지 당 게시글 수(recordPerPage)를 알아야 한다.
		int recordPerPage = 3;
		int begin = (nowPage - 1) * recordPerPage + 1;
		int end = begin + recordPerPage - 1;

		// BDao -> mapper 로 전달할 Map 생성
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);

		// BDao 생성
		BDao bDao = BDao.getInstance();

		// BDao 의 getBoardList() 메소드 호출
		List<Bdto> list = bDao.getBoardList(map);

		// request 에 list 저장
		request.setAttribute("list", list);

		// 전체 게시글 개수 구하기
		int totalRecord = bDao.getTotalRecord();

		// ◀ 1 2 3 ▶ 생성 (pagingView)
		String pagingView = Paging.getPaging("/myHome/boardList.bo", nowPage, recordPerPage, totalRecord);

		// request 에 pagingView 저장
		request.setAttribute("pagingView", pagingView);

		// 결과 경로 + 이동 방법을 저장할 ActionForward 생성
		ActionForwad forward = new ActionForwad();
		forward.setPath("/board/boardList.jsp");
		forward.setRedirect(false);

		return forward;
	}

}