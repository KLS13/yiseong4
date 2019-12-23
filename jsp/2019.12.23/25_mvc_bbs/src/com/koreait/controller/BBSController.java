package com.koreait.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.koreait.bbs.model.Action;
import com.koreait.bbs.model.DownloadAction;
import com.koreait.bbs.model.GoInsertBBSPage;
import com.koreait.bbs.model.GoRemoveBBSPage;
import com.koreait.bbs.model.GoUpdateBBSPage;
import com.koreait.bbs.model.InsertBBSAction;
import com.koreait.bbs.model.ListBBSAction;
import com.koreait.bbs.model.RemoveBBSAction;
import com.koreait.bbs.model.UpdateBBSAction;
import com.koreait.bbs.model.ViewBBSAction;

/**
 * Servlet implementation class BBSController
 */
@WebServlet("*.do")
public class BBSController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BBSController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// request, response 인코딩
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		// 요청 확인 (xxxx.do)
		String requestURI = request.getRequestURI();   // /25_mvc_bbs/list.do
		String contextPath = request.getContextPath(); // /25_mvc_bbs
		String cmd = requestURI.substring(contextPath.length()); // /list.do
		
		// Action action 선언
		Action action = null;
		
		// cmd 에 다른 model 호출
		switch ( cmd ) {
		// DB처리
		case "/list.do":
			action = new ListBBSAction();
			break;
		case "/view.do":
			action = new ViewBBSAction();
			break;
		case "/insert.do":
			action = new InsertBBSAction();
			break;
		case "/update.do" :
			action = new UpdateBBSAction();
			break;
		case "/remove.do" :
			action = new RemoveBBSAction();
			break;
		// 단순이동
		case "/insertBBSPage.do":
			action = new GoInsertBBSPage();
			break;
		case "/download.do" :
			action = new DownloadAction();
			break;
		case "/updateBBSPage.do" :
			action = new GoUpdateBBSPage();
			break;
		case "/removeBBSPage.do" :
			action = new GoRemoveBBSPage();
			break;
		}
		
		// path 알아내기
		String path = action.command(request, response);
		
		// path 이동
		request.getRequestDispatcher(path).forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
